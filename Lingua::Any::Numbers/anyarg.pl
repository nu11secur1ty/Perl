#!/usr/bin/perl
use strict;
use warnings;
use JSON;
use Lingua::Any::Numbers qw(:std);
#############################################
# Change Lang
#my $ln = "PT";

my %otr;
	for (my $i = 1;$i < 51; $i++){
		$otr {$i} = to_string($i, "@ARGV");	
	}

# my %ff{'ascii'}=1;
# print encode_json(\%otr)."\n\n";

my $jsn = JSON->new->ascii(1);
print $jsn->encode(\%otr)."\n\n";
       
#my $jsnn = JSON->new->latin1(0);
#print $jsnn->encode(\%otr)."\n\n
