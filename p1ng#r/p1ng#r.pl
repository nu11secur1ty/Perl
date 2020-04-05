#!/usr/bin/perl
# @nu11secur1ty
use strict;
use warnings;
use diagnostics;

my $site = $ARGV[0];   # give the website
  my $action = `ping $site`;
print "$action\n";
