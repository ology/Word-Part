package WordPart::Forms::Fragment;

use strict;
use warnings FATAL => 'all';
use parent qw(
    Chameleon5::Contrib::Forms::Base
    Chameleon5::Contrib::Forms::Validators
);

use WordPart::DataObjects::Fragment::Manager;

sub init
{
    my ( $self, %args ) = @_;

    $self->attrs({
        key    => $args{key} || 'part',
        uri    => $args{uri},
        method => 'post',
    });

    if ( exists $args{affix} )
    {
        my $fragment = WordPart::DataObjects::Fragment::Manager->get_objects(
            query => [ affix => $args{affix} ],
        )->[0];
        if ($fragment)
        {
            $self->defaults({
                post       => $fragment->post,
                affix      => $fragment->affix,
                pre        => $fragment->pre,
                definition => $fragment->definition,
            });
        }
    }

    $self->meta([
        post  => { widget => 'text' },
        affix => { widget => 'text' },
        pre   => { widget => 'text' },
        definition => { widget => 'textarea' },
        submit     => {
            widget  => 'submit',
            display => 'Save',
            attrs   => { class => 'button tiny' }
        },
    ]);

    return;
}

sub process
{
    my ($self) = @_;

    my $fragment = WordPart::DataObjects::Fragment::Manager->get_objects(
        query => [ affix => $self->data->{affix} ],
    )->[0];
    if ( $fragment )
    {
        $fragment->post( $self->data->{post} );
        $fragment->affix( $self->data->{affix} );
        $fragment->pre( $self->data->{pre} );
        $fragment->definition( $self->data->{definition} );
        $fragment->save( changes_only => 1 );
    }
    else
    {
        WordPart::DataObjects::Fragment->new(
            post       => $self->data->{post},
            affix      => $self->data->{affix},
            pre        => $self->data->{pre},
            definition => $self->data->{definition},
        )->save;
    }

    $self->site->response->push_message( 'Fragments updated.' );
    $self->site->response->redirect( $self->site->uri('home') );

    return;
}

1;
