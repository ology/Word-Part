package Word::Partition;

use Dancer ':syntax';
use Dancer::Plugin::DBIC;
use Dancer::Plugin::Auth::Extensible;
use Dancer::Plugin::FlashMessage;

use Lingua::Word::Parser;
use Readonly;

Readonly my $SCHEMA => schema config->{plugins}{Database}{database};
Readonly my $PREFIX => '(?=\w)';
Readonly my $SUFFIX => '(?<=\w)';
Readonly my $MAX_QUERY_SIZE => 30;

our $VERSION = '0.1';

=head1 NAME

Word::Partition - Interact with word-parts

=head1 ROUTES

=head2 /

Go to the index page

=cut

get '/' => sub {
    my $count = $SCHEMA->resultset('Fragment')->search->count;

    my $user = logged_in_user;

    template 'index',
        {
            entries        => $count,
            logged_in_user => $user,
        };
};

=head2 /new

Show the form to create a new entry

=cut

get '/new' => require_login sub {
    my $user = logged_in_user;

    template 'edit',
        {
            method         => 'add',
            logged_in_user => $user,
        };
};

=head2 /add

Create a new entry in the database

=cut

post '/add' => require_login sub {
    _add_entry(
        affix      => params->{affix},
        prefix     => params->{prefix},
        suffix     => params->{suffix},
        definition => params->{definition},
        etymology  => params->{etymology},
    );
    redirect '/search';
};

=head2 /delete

Delete an entry from the database

=cut

get '/delete' => require_login sub {
    my $id = params->{id};
    _delete_entry($id);
    redirect '/search';
};

=head2 /update

Update an existing entry in the database

=cut

post '/update' => require_login sub {
    _update_entry(
        id         => params->{id},
        affix      => params->{affix},
        prefix     => params->{prefix},
        suffix     => params->{suffix},
        definition => params->{definition},
        etymology  => params->{etymology},
    );
};

=head2 /edit

Show the form to update an entry

=cut

get '/edit' => require_login sub {
    unless ( params->{id} ) {
        redirect '/new';
        return;
    }

    my $fragment = $SCHEMA->resultset('Fragment')->single(
        {
            id => params->{id}
        }
    );

    my $user = logged_in_user;

    template 'edit',
        {
            id             => $fragment->id,
            affix          => $fragment->affix,
            definition     => $fragment->definition,
            etymology      => $fragment->etymology,
            method         => 'update',
            logged_in_user => $user,
        };
};

=head2 /parse

Show the parse form and results

=cut

get '/parse' => sub {
    my $results;
    my $query = params->{query};

    if ( $query && length $query > $MAX_QUERY_SIZE ) {
        flash error => "The word cannot have more than $MAX_QUERY_SIZE letters";
    }
    elsif ( $query ) {
        my $p = Lingua::Word::Parser->new(
            word   => $query,
            dbname => config->{plugins}{Database}{database},
            dbuser => config->{plugins}{Database}{username},
            dbpass => config->{plugins}{Database}{password},
            dbtype => config->{plugins}{Database}{driver},
            dbhost => config->{plugins}{Database}{host},
        );

        # Find the known word-part positions.
        $p->knowns;
        $p->power;
        my $score = $p->score_parts( '[', ']' );

        for my $key ( reverse sort keys %$score )
        {
            push @$results, $score->{$key};
        }
    }

    my $user = logged_in_user;

    template 'parse',
      {
        query          => $query,
        results        => $results,
        logged_in_user => $user,
      };
};

=head2 /search

Show the search form and results

=cut

get '/search' => sub {
    my $query = params->{query};

    my $type = params->{type};
    $type //= 'affix';

    my $etym = params->{etymology};

    my $results;
    if ( length $query ) {
        # Allow entry of prefix/suffix indicators with hyphens
        my ( $suffix, $affix, $prefix ) = $query =~ m/^(-?)([;,\s\w]+)(-?)$/g;
        $affix //= '';
        $prefix = $prefix ? $PREFIX : '';
        $suffix = $suffix ? $SUFFIX : '';
        my $like = quotemeta( "$suffix$affix$prefix" );

        my $fragments = $SCHEMA->resultset('Fragment')->search(
            {
                $type => { like => '%' . $like . '%' },
                $etym ? ( etymology => $etym ) : (),
            },
            {
                order_by => { -asc => $type }
            }
        );

        while ( my $result = $fragments->next ) {
            push @$results,
                {
                    id         => $result->id,
                    affix      => $result->affix,
                    definition => $result->definition,
                    etymology  => $result->etymology,
                };
        }
    }

    my $user = logged_in_user;

    template 'search',
        {
            query          => $query,
            results        => $results,
            checked        => $type,
            etymology      => $etym,
            logged_in_user => $user,
        };
};

sub _add_entry {
    my %args = @_;

    if ( params->{affix} && params->{definition} ) {
        my $affix = _prefix_suffix( $args{affix}, $args{prefix}, $args{suffix} );

        $SCHEMA->resultset('Fragment')->create(
            {
                affix      => $affix,
                definition => $args{definition},
                etymology  => $args{etymology},
            }
        );
    }
    else {
        flash error => 'Neither affix nor definition can be NULL';
        redirect '/new';
    }
}

sub _delete_entry {
    my $id = shift;
    my $fragment = $SCHEMA->resultset('Fragment')->find(
        {
            id => $id,
        }
    );
    if ( $fragment ) {
        $fragment->delete();
    }
    else {
        flash error => "No fragment can be found for id $id";
    }
}

sub _update_entry {
    my %args = @_;

    my $fragment = $SCHEMA->resultset('Fragment')->find(
        {
            id => $args{id},
        }
    );
    unless ( $args{fragment} ) {
        flash error => "Can't find fragment for id: $args{id}";
        redirect '/search';
    }

    if ( $args{affix} && $args{definition} ) {
        my $affix = _prefix_suffix( $args{affix}, $args{prefix}, $args{suffix} );

        $fragment->affix($affix);
        $fragment->definition( $args{definition} );
        $fragment->etymology( $args{etymology} );
        $fragment->update;

        redirect '/search';
    }
    else {
        flash error => 'Neither affix nor definition can be empty';
        redirect "/edit?id=$args{id}";
    }
}

sub _login_page_handler {
    my $login_fail_message = vars->{login_failed} ? 'LOGIN FAILED' : '';
    template 'login',
        {
            return_url         => params->{return_url},
            login_fail_message => $login_fail_message,
        };
}

sub _prefix_suffix {
    my ( $affix, $prefix, $suffix ) = @_;
    $affix  = $SUFFIX . $affix if $suffix;
    $affix .= $PREFIX          if $prefix;
    return $affix;
}

true;

__END__

=head1 AUTHOR

Gene Boggs <gene@cpan.org>

=cut
