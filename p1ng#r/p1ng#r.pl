#!/usr/bin/perl
# @nu11secur1ty
use strict;
use warnings;
use diagnostics;

my $site = $ARGV[0];   # give the website
  my $action = `ping -c 4 $site`;
print "$site\n$action\n";
