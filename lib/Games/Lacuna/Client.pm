package Games::Lacuna::Client;
use strict;
use warnings;
use SDL 2.518;
use SDL::Video;
use SDL::Event;
use SDL::Events;
use SDLx::App;

use SDLx::Widget::Textbox;

sub new {
    my $class = shift;
    my $self = {assets => 'Lacuna-Assets'};
       $self->{assets} = $_[0] if $_[0] && -d $_[0];
       $self = bless $self, $class;

    return $self;
}

sub run {
    my $self = shift;

    my $app = SDLx::App->new( title => "The Lacuna Expanse", width => 600, height => 480, depth => 32, flags => SDL_DOUBLEBUF | SDL_HWSURFACE );

    $app->add_event_handler( \&_quit_handler );
    $app->add_event_handler( \&_menu_handler );

    #Should make an asset loader to use here.

    $self->{logo} = SDLx::Surface->load( $self->{assets}.'/ui/logo.png' );

    $self->{logo}->blit( $app, [0,0,$self->{logo}->w, $self->{logo}->h] );

    $app->update();

    $self->{app} = $app;

    $self->{app}->run();
}

sub _quit_handler {
    my ($event, $control) = @_;

    $control->stop if $event->type == SDL_QUIT;
}

my $textbox;
sub _menu_handler {
    my ($event, $app) = @_;

    if(!defined $textbox) {
        $textbox = SDLx::Widget::Textbox->new(app => $app, x => 200, y => 200, w => 200, h => 20);
        $textbox->show;
    }
}

#################### main pod documentation begin ###################
## Below is the stub of documentation for your module. 
## You better edit it!


=head1 NAME

Games::Lacuna::Client - Native Desktop Client for the Lacuna Expanse Game

=head1 SYNOPSIS

  use Games::Lacuna::Client;
  Games::Lacuna::Client::run();

=head1 DESCRIPTION

Start the Lacuna Client. Requires artwork and the API from 

http://www.lacunaexpanse.com/developers/

Get the artwork from http://github.com/plainblack/Lacuna-Assets 

Put Lacuna-Assets folder in same folder as this code.

=head1 USAGE

perl -Ilib lacuna-cli.pl [/path/to/Lacuna-Assets]

=head1 BUGS

http://github.com/PerlGameDev/Lacuna-Client-SDL/issues

=head1 SUPPORT

#sdl irc.perl.org

sdl-devel@perl.org

=head1 AUTHOR

    Kartik Thakore
    CPAN ID: KTHAKORE
    PerlGameDev
    KTHAKORE@cpan.org
    http://github.com/PerlGameDev

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.


=head1 SEE ALSO

perl(1).

=cut

#################### main pod documentation end ###################


1;
# The preceding line will help the module return a true value

