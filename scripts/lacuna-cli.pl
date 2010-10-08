use strict;
use warnings;
use JSON::RPC2::Client;
use Games::Lacuna::Client;

my $game = Games::Lacuna::Client->new(@ARGV);

$game->run();


