#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'WordPart' ) || print "Bail out!\n";
}

diag( "Testing WordPart $WordPart::VERSION, Perl $], $^X" );
