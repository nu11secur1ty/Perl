#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;

my $value = 100;
changeit( $value );
print "$value\n";

sub changeit {
    $_[0]++;
}
