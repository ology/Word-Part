use utf8;
package Word::Partition::Schema::Result::Fragment;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Word::Partition::Schema::Result::Fragment

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<fragment>

=cut

__PACKAGE__->table("fragment");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 affix

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 50

=head2 definition

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 etymology

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "affix",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 50 },
  "definition",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "etymology",
  { data_type => "varchar", is_nullable => 1, size => 50 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

__PACKAGE__->add_unique_constraint([qw(affix etymology)]);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-08-08 17:45:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Fx86RyxUGGShyZtdMc8qJg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
