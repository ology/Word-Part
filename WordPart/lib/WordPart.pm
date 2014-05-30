package WordPart;
use strict;
use warnings FATAL => 'all';

use parent qw( Chameleon5::Site::Base );

our $VERSION = 0.1;

use WordPart::DataObjects::Fragment::Manager;
use WordPart::Forms::Fragment;
use WordPart::Tables::Fragment;

use Data::Dumper::Concise;

use lib '/Users/gene/sandbox/github/ology/Lingua-Word-Parser/lib';
use Lingua::Word::Parser;

=head1 NAME

WordPart - Partition a word into scored, known fragments

=head1 DEBUGGING

 use Data::Dumper::Concise;
 $self->logger->debug(Dumper$foo);

=cut

sub view_parts
{
    my ( $self, %args ) = @_;

    my %query;
    if ( $self->form('term') )
    {
        %query = (
            query => [
                or => [
                    affix      => { like => $self->form('term') },
                    definition => { like => $self->form('term') },
                ],
            ],
        );
    }

    my $fragments = WordPart::Tables::Fragment->new(
        site  => $self,
    )->handle_request(%query);

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

sub parse_word {
    my ( $self, %args ) = @_;

    my $p = Lingua::Word::Parser->new(
        word   => $args{word},
        dbname => 'word_part',
        dbuser => 'root',
        dbpass => 'abc123',
    );
    #warn Dumper $p->{lex};

    # Find the known word-part positions.
    my ($known) = $p->knowns;
    my $combos = $p->power;
    my $score = $p->score;
    #warn Dumper $score;
#    warn Dumper $score->{ [ sort keys $score ]->[-1] };

#    $self->tree_append( tag => 'score', data => $score );
    $self->fast_append( tag => 'score', data => { dump => Dumper($score) } );

    return;
}

1;
