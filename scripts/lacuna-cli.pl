use strict;
use warnings;
use Games::Lacuna::Client;

my $game = Games::Lacuna::Client->new(@ARGV);

$game->run();

