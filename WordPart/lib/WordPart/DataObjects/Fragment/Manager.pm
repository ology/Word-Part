package WordPart::DataObjects::Fragment::Manager;

use strict;

use base qw(Rose::DB::Object::Manager);

use WordPart::DataObjects::Fragment;

sub object_class { 'WordPart::DataObjects::Fragment' }

__PACKAGE__->make_manager_methods('fragments');

1;

