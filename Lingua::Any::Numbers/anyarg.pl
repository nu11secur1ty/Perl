#!/usr/bin/perl
use strict;
use warnings;
use JSON;
use Lingua::Any::Numbers qw(:std);
#############################################
# From 1 to 51 
my %otr;
	for (my $i = 1;$i < 51; $i++){
		$otr {$i} = to_string($i, "@ARGV");	
	}
# ASCII armor setup 
	my $jsn = JSON->new->ascii(1);
		print $jsn->encode(\%otr)."\n\n";
