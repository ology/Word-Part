use strict;
use warnings;
use ExtUtils::MakeMaker;

# Normalize version strings like 6.30_02 to 6.3002,
# so that we can do numerical comparisons on them.
my $eumm_version = $ExtUtils::MakeMaker::VERSION;
$eumm_version =~ s/_//;

WriteMakefile(
    ($eumm_version >= 6.3001 ? ('LICENSE'=> 'perl') : ()),
    NAME         => 'Word::Partition',
    AUTHOR       => 'GENE BOGGS <gene@cpan.org>',
    VERSION_FROM => 'lib/Word/Partition.pm',
    ABSTRACT     => 'Partition Words into Scored Fragments',
    PL_FILES     => {},
    PREREQ_PM    => {
        'Dancer'                           => 1.3140,
        'Dancer::Plugin::DBIC'             => 0,
        'Dancer::Plugin::Auth::Extensible' => 0,
        'Dancer::Plugin::Database'         => 0,
        'DBI'                              => 0,
        'Lingua::Word::Parser'             => 0,
        'Readonly'                         => 0,
        'Template'                         => 0,
        'Test::More'                       => 0,
        'YAML'                             => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Word-Partition-*' },
);
