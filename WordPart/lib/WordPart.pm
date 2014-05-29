package WordPart;
use strict;
use warnings FATAL => 'all';

use parent qw( Chameleon5::Site::Base );

our $VERSION = 0.1;

use WordPart::DataObjects::Fragment::Manager;
use WordPart::Forms::Fragment;
use WordPart::Tables::Fragment;

=head1 NAME

WordPart - Partitions of words

=head1 DEBUGGING

 use Data::Dumper::Concise;
 $self->logger->debug(Dumper$foo);

=cut

sub view_parts
{
    my ( $self, %args ) = @_;

    my $fragments = WordPart::Tables::Fragment->new(
        site  => $self,
    )->handle_request;

    return;
}

=head2 search_parts()

Filter the fragment table by a search term.

=cut

sub search_parts
{
    my ( $self, %args ) = @_;

    return unless $args{search};

    my $fragments = WordPart::Tables::Fragment->new(
        site  => $self,
    )->handle_request(
        query => [
            affix => { like => $args{search} },
        ],
    );

    return;
}


sub edit_part
{
    my ( $self, %args ) = @_;

    if ( $args{remove} )
    {
        my $part = WordPart::DataObjects::Fragment::Manager->get_objects(
            query => [ affix => $args{affix} ]
        )->[0];
        $part->delete if $part;

        $self->response->redirect('home');
    }
    else
    {
        my $form = WordPart::Forms::Fragment->new(
            site => $self,
            uri  => $self->uri( $self->page_name, %args ),
            %args
        )->handle_request;
    }

    return;
}

1;
