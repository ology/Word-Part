package Word::Partition;

use Dancer ':syntax';
use Dancer::Plugin::DBIC;
use Dancer::Plugin::Auth::Extensible;

use Carp;
use Lingua::Word::Parser;
use Readonly;

Readonly my $SCHEMA => schema 'word_part';
Readonly my $PREFIX => '(?<=\w)';
Readonly my $SUFFIX => '(?=\w)';

our $VERSION = '0.1';

get '/' => sub {
    template 'index';
};

get '/new' => require_login sub {
    template 'edit',
        {
            method => 'add',
        };
};

post '/add' => require_login sub {
    my $affix = prefix_suffix(
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
};

get '/delete' => require_login sub {
    my $fragment = $SCHEMA->resultset('Fragment')->find(
        {
            id => params->{id}
        }
    );
    croak "Can't find fragment for id: " . params->{id}
        unless $fragment;

    $fragment->delete();

    redirect '/search';
};

post '/update' => require_login sub {
    my $fragment = $SCHEMA->resultset('Fragment')->find(
        {
            id => params->{id}
        }
    );
    croak "Can't find fragment for id: " . params->{id}
        unless $fragment;

    my $affix = prefix_suffix(
        params->{affix}, params->{prefix}, params->{suffix}
    );

    $fragment->affix($affix);
    $fragment->definition( params->{definition} );
    $fragment->etymology( params->{etymology} );
    $fragment->update;

    redirect '/search';
};

get '/edit' => require_login sub {
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

get '/parse' => require_login sub {
    my $results;
    my $query = params->{query};

    if ( $query ) {
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
        my $score = $p->score( '[', ']' );

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

get '/search' => require_login sub {
    my $query = params->{query};

    my $type = params->{type};
    $type //= 'affix';

    my $results;
    if ( length $query ) {
        my @parts  = $query =~ m/^(-?)(\w+)(-?)$/g;
        my $prefix = $parts[0] ? $PREFIX : '';
        my $affix  = $parts[1];
        my $suffix = $parts[2] ? $SUFFIX : '';
        my $like   = quotemeta( "$prefix$affix$suffix" );

        my $fragments = $SCHEMA->resultset('Fragment')->search(
            {
                $type => { like => "%$like%" },
            },
            {
                order_by => { -asc => 'affix' }
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
        query   => $query,
        results => $results,
        checked => $type,
      };
};

sub login_page_handler {
    my $login_fail_message = vars->{login_failed} ? 'LOGIN FAILED' : '';
    template 'login',
        {
            return_url         => params->{return_url},
            login_fail_message => $login_fail_message,
        };
}

sub prefix_suffix {
    my ( $affix, $prefix, $suffix ) = @_;
    $affix  = $SUFFIX . $affix if $suffix;
    $affix .= $PREFIX          if $prefix;
    return $affix;
}

true;
