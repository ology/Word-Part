package WordPart;
use strict;
use warnings FATAL => 'all';

use parent qw( Chameleon5::Site::Base );

our $VERSION = 0.1;

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

    my $fragments = WordPart::Tables::Fragment->new( site => $self )->handle_request();

    return;
}

sub edit_part
{
    my ( $self, %args ) = @_;

    my $form = WordPart::Forms::Fragment->new(
        site  => $self,
        uri   => $self->uri( $self->page_name, %args ),
        %args
    )->handle_request;

    return;
}

1;
