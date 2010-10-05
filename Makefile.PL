

use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'Games::Lacuna::Client',
    VERSION_FROM => 'lib/Games/Lacuna/Client.pm', # finds \$VERSION
    AUTHOR       => 'Kartik Thakore (KTHAKORE@cpan.org)',
    ABSTRACT     => 'Native Desktop Client for the Lacuna Expanse Game',
    PREREQ_PM    => {
                     'Test::Simple' => 0.44,
                    },
);
