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

    my $user = logged_in_user || '';

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
    template 'edit',
        {
            method => 'add',
        };
};

=head2 /add

Create a new entry in the database

=cut

post '/add' => require_login sub {
    if ( params->{affix} && params->{definition} ) {
        my $affix = _prefix_suffix(
            params->{affix}, params->{prefix}, params->{suffix}
        );

        $SCHEMA->resultset('Fragment')->create(
            {
                affix      => $affix,
                definition => params->{definition},
                etymology  => params->{etymology},
            }
        );

        redirect '/search';
    }
    else {
        flash error => 'Neither affix nor definition can be NULL';
        redirect '/new';
    }
};

=head2 /delete

Delete an entry from the database

=cut

get '/delete' => require_login sub {
    my $id = params->{id};

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

    redirect '/search';
};

=head2 /update

Update an existing entry in the database

=cut

post '/update' => require_login sub {
    my $id = params->{id};

    my $fragment = $SCHEMA->resultset('Fragment')->find(
        {
            id => $id,
        }
    );
    unless ( $fragment ) {
        flash error => "Can't find fragment for id: $id";
        redirect '/search';
    }

    if ( params->{affix} && params->{definition} ) {
        my $affix = _prefix_suffix(
            params->{affix}, params->{prefix}, params->{suffix}
        );

        $fragment->affix($affix);
        $fragment->definition( params->{definition} );
        $fragment->etymology( params->{etymology} );
        $fragment->update;

        redirect '/search';
    }
    else {
        flash error => 'Neither affix nor definition can be NULL';
        redirect "/edit?id=$id";
    }
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

    template 'edit',
        {
            id         => $fragment->id,
            affix      => $fragment->affix,
            definition => $fragment->definition,
            etymology  => $fragment->etymology,
            method     => 'update',
        };
};

=head2 /parse

Show the parse form and results

=cut

get '/parse' => require_login sub {
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

    template 'parse',
      {
        query   => $query,
        results => $results,
      };
};

=head2 /search

Show the search form and results

=cut

get '/search' => require_login sub {
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

    template 'search',
        {
            query     => $query,
            results   => $results,
            checked   => $type,
            etymology => $etym,
        };
};

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
