# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 2;

BEGIN { use_ok( 'Games::Lacuna::Client' ); }

my $object = Games::Lacuna::Client->new ();
isa_ok ($object, 'Games::Lacuna::Client');


