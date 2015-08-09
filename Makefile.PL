use strict;
use warnings;
use ExtUtils::MakeMaker;

# Normalize version strings like 6.30_02 to 6.3002,
# so that we can do numerical comparisons on them.
my $eumm_version = $ExtUtils::MakeMaker::VERSION;
$eumm_version =~ s/_//;

WriteMakefile(
    NAME                => 'Word::Partition',
    AUTHOR              => 'GENE BOGGS <gene@cpan.org>',
    VERSION_FROM        => 'lib/Word/Partition.pm',
    ABSTRACT            => 'Partition Words into Scored Fragments',
    ($eumm_version >= 6.3001
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'YAML'       => 0,
        'Dancer'     => 1.3140,
        'Dancer::Plugin::DBIC' => 0,
        'Dancer::Plugin::Auth::Extensible' => 0,
        'Dancer::Plugin::Database' => 0,
        'Lingua::Word::Parser' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Word-Partition-*' },
);
