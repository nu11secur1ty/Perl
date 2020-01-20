#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;

use Lingua::Any::Numbers qw(:std);

foreach my $lang ( available ) {
   printf "%s\n", to_string(  45, $lang );
   printf "%s\n", to_ordinal( 45, $lang );
}
