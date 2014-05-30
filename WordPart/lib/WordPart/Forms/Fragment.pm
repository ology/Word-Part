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

    if ( exists $args{affix_id} )
    {
        my $fragment = WordPart::DataObjects::Fragment::Manager->get_objects(
            query => [ id => $args{affix_id} ],
        )->[0];
        if ($fragment)
        {
            $self->defaults({
                affix      => $fragment->affix,
                affix_id   => $fragment->id,
                definition => $fragment->definition,
            });
        }
    }

    $self->meta([
        affix_id   => { widget => 'hidden' },
        affix      => { widget => 'text' },
        definition => { widget => 'text' },
        pre        => { widget => 'checkbox', display => '(?<=\w)', attrs => { value => '(?<=\w)' } },
        post       => { widget => 'checkbox', display => '(?=\w)', attrs => { value => '(?=\w)' } },
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
        query => [ id => $self->data->{affix_id} ],
    )->[0];
    if ( $fragment )
    {
        $fragment->definition( $self->data->{definition} );
        $fragment->save( changes_only => 1 );
    }
    else
    {
        WordPart::DataObjects::Fragment->new(
            affix      => $self->data->{affix},
            definition => $self->data->{definition},
        )->save;
    }

    $self->site->response->push_message( 'Fragments updated.' );
    $self->site->response->redirect( $self->site->uri('home') );

    return;
}

1;
