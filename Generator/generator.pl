#/usr/bin/perl -w
###################################                  
#  Copyright @ nu11secur1ty       #
###################################
use strict;
use warnings;
use Term::ANSIColor;

print color("blue"), 
"WELCOME TO '8' DIGITAL NUMBERS GENERATOR
Code by: nu11secur1ty\n", color("reset");

print "Please wait...\n";

open my $outfile, ">", "output.txt";
     my @int = (10000000 .. 20000000);
foreach my $character (@int) {
	print $outfile "$character\n";
}
print color("yellow"),
"Great job, user, you got it =) \n", color("reset");
close $outfile;
