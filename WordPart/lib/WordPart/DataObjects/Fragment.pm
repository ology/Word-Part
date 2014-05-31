package WordPart::DataObjects::Fragment;

use strict;

use base qw(Chameleon5::DB::Object);

__PACKAGE__->meta->setup(
    schema => 'word_part',
    table  => 'fragment',

    columns => [
        id         => { type => 'serial', not_null => 1 },
        affix      => { type => 'varchar', default => '', length => 50, not_null => 1 },
        definition => { type => 'varchar', default => '', length => 255, not_null => 1 },
        etymology  => { type => 'varchar', length => 50 },
    ],

    primary_key_columns => [ 'id' ],
);

1;

