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
                etymology  => $fragment->etymology,
            });
        }
    }

    my @choices = ();
    for my $choice (qw( latin greek ))
    {
        push @choices, { value => $choice, display => ucfirst $choice };
    }

    $self->meta([
        affix_id   => { widget => 'hidden' },
        affix      => { widget => 'text' },
        definition => { widget => 'text' },
        etymology  => { widget => 'select', choices => \@choices },
        pre        => { widget => 'checkbox', display => 'Follows', attrs => { value => '(?<=\w)' } },
        post       => { widget => 'checkbox', display => 'Precedes', attrs => { value => '(?=\w)' } },
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

    $self->data->{affix} = $self->data->{pre} . $self->data->{affix} if $self->data->{pre};
    $self->data->{affix} .= $self->data->{post} if $self->data->{post};

    my $fragment = WordPart::DataObjects::Fragment::Manager->get_objects(
        query => [ id => $self->data->{affix_id} ],
    )->[0];
    if ( $fragment )
    {
        $fragment->affix( $self->data->{affix} );
        $fragment->definition( $self->data->{definition} );
        $fragment->etymology( $self->data->{etymology} );
        $fragment->save( changes_only => 1 );
    }
    else
    {
        WordPart::DataObjects::Fragment->new(
            affix      => $self->data->{affix},
            definition => $self->data->{definition},
            etymology  => $self->data->{etymology},
        )->save;
    }

    $self->site->response->push_message( 'Fragments updated.' );
    $self->site->response->redirect( $self->site->uri('home') );

    return;
}

1;
