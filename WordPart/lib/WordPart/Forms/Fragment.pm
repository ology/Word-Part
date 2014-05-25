package WordPart::Forms::Fragment;

use strict;
use warnings FATAL => 'all';
use parent qw(
    Chameleon5::Contrib::Forms::Base
    Chameleon5::Contrib::Forms::Validators
);

sub init
{
    my ( $self, %args ) = @_;
#$self->site->logger->debug("URI: '$args{uri}'");
#$self->site->logger->debug("PART: '$args{affix}'");

    $self->attrs({
        key    => $args{key} || 'part',
        uri    => $args{uri},
        method => 'post',
    });

    my $fragment = WordPart::DataObjects::Fragment::Manager->get_objects(
        query => [ affix => $args{affix} ],
    )->[0];
    if ($fragment)
    {
        $self->{_fragment} = $fragment;
        $self->defaults({
            prefix     => $fragment->prefix,
            affix      => $fragment->affix,
            suffix     => $fragment->suffix,
            definition => $fragment->definition,
        });
    }

    $self->meta([
        prefix     => { widget => 'text' },
        affix      => { widget => 'text' },
        suffix     => { widget => 'text' },
        definition => { widget => 'textarea' },
        submit     => { widget => 'submit', display => 'Save' },
    ]);

    return;
}

sub process
{
    my ($self) = @_;
$self->site->logger->debug("ENTER: process()");
$self->site->logger->debug("PART: '" . $self->{_fragment} . "'");

    if ( $self->{_fragment} )
    {
        $self->{_fragment}->affix( $self->data->{affix} );
        $self->{_fragment}->definition( $self->data->{definition} );
        $self->{_fragment}->save( changes_only => 1 );

        $self->site->response->push_message( 'Fragment updated.' );
    }
    else
    {
        WordPart::DataObjects::Fragment->new(
            affix      => $self->data->{affix},
            definition => $self->data->{definition},
        )->save;

        $self->site->response->push_message( 'Fragment added.' );
    }

    $self->site->response->redirect( $self->site->uri( 'affix', affix => $self->data->{affix} ) );

    return;
}

1;
