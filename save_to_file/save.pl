#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;
 
my $filename = 'report.log';
open(my $fh, '>>', $filename) or die "Could not open file '$filename' $!";
print $fh "This is your report";
close $fh;
print 'done';
