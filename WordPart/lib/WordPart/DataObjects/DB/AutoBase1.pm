package WordPart::DataObjects::DB::AutoBase1;

use strict;

use base 'Rose::DB';

__PACKAGE__->use_private_registry;

__PACKAGE__->register_db
(
  driver   => 'mysql',
  dsn      => 'dbi:mysql:database=word_part;host=localhost;mysql_enable_utf8=1;mysql_read_default_file=/etc/my.cnf',
  password => 'abc123',
  schema   => 'word_part',
  username => 'root',
);

1;
