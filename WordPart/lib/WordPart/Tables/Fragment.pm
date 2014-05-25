package WordPart::Tables::Fragment;

#use strict;
use warnings;

use parent qw( Chameleon5::Contrib::PagedResults );

use DateTime::Format::Strptime;

use WordPart::DataObjects::Fragment::Manager;

sub init
{
    my ( $self, %args ) = @_;

    $self->defaults(
        name            => 'parts',
        uri             => $args{uri},
        per_page        => 10,
        per_page_values => [10],
        sort            => 'affix asc',
        sort_values     => [ { 'Most Recent' => 'affix asc' }, ],
    );

    return;
}

sub load_data
{
    my ( $self, %manager_args ) = @_;

    $manager_args{sort_by}  = $self->sort;
    $manager_args{page}     = $self->page;
    $manager_args{per_page} = $self->per_page;

    my $manager   = WordPart::DataObjects::Fragment::Manager;
    my $formatter = DateTime::Format::Strptime->new( pattern => '%B %e, %Y' );

    for my $result ( @{ $manager->get_objects( %manager_args ) } )
    {
        $self->add_result_tree(
            %{ $result->as_tree_tz( tz => $self->site->time_zone, formatter => $formatter ) } );
    }
    $self->total_results( $manager->get_objects_count( %manager_args ) );

    return;
}

1;
