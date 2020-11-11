#!/usr/bin/perl
# Author V.Varbanovski @nu11secur1ty 2020
use strict;
use warnings;
use diagnostics;
use Term::ANSIColor;

my $journal = `journalctl -r --no-pager > jk && cat jk | grep ssh`;
my $journal_login = `journalctl -r --no-pager > jk && cat jk | grep login`;
print "\n";
	print color('yellow');
			print "SSH INFO - the newest entries\n";
		print color('reset');
	print color('red');	
		print "$journal\n";
	print color('reset');
		print color('yellow');
			print "LOGIN INFO - the newest entries\n";
		print color('reset');
	print color('blue');
		print "$journal_login\n";
			print color('reset');
