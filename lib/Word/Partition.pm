package Word::Partition;

use Dancer ':syntax';
use Dancer::Plugin::DBIC;
use Dancer::Plugin::Auth::Extensible;

use Lingua::Word::Parser;

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
    my $affix = params->{affix};
    $affix    = '(?<=\w)' . $affix if params->{prefix};
    $affix   .= '(?=\w)'           if params->{suffix};

    my $schema = schema 'word_part';
    $schema->resultset('Fragment')->create(
        {
            affix      => $affix,
            definition => params->{definition},
            etymology  => params->{etymology},
        }
    );

    template 'search', {};
};

get '/delete' => require_login sub {
    my $schema   = schema 'word_part';
    my $fragment = $schema->resultset('Fragment')->find(
        {
            id => params->{id}
        }
    );
    $fragment->delete();
    template 'search', {};
};

post '/update' => require_login sub {
    my $schema   = schema 'word_part';
    my $fragment = $schema->resultset('Fragment')->find(
        {
            id => params->{id}
        }
    );

    my $affix = params->{affix};
    $affix    = '(?<=\w)' . $affix if params->{prefix};
    $affix   .= '(?=\w)'           if params->{suffix};

    $fragment->affix($affix);
    $fragment->definition( params->{definition} );
    $fragment->etymology( params->{etymology} );
    $fragment->update;

    template 'search', {};
};

get '/edit' => require_login sub {
    my $schema   = schema 'word_part';
    my $fragment = $schema->resultset('Fragment')->single(
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
    my $type  = params->{type};

    $type //= 'affix';

    my ( $rs, $results );
    if ( length $query ) {
        $rs = _perform_search( $query, $type );
        while ( my $result = $rs->next ) {
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

sub _perform_search {
    my ( $query, $type ) = @_;

    my $schema = schema 'word_part';

    my $fragments = $schema->resultset('Fragment')->search(
        {
            $type => { like => "%$query%" },
        },
        {
            order_by => { -asc => 'affix' }
        }
    );

    return $fragments;
}

true;
