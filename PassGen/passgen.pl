#!/usr/bin/perl -W

###########################
# copyright nu11secur1ty  #
###########################
use warnings;
use strict;
use Term::ANSIColor;

print color("green"), "Welcome to program 'passgen'!\n",color("reset");
print color("blue"), "code by nu11secur1ty\n", color("reset");
print color("red"),"Please press ENTER to generate your password...\n",color ("reset");{
	<>;
	}
my $password;
   @charlist = (('A'..'Z'), ('a'..'z'), ('!','@','%','^'), (0..9));
   $range = $#charlist + 1;
for (1..17) {
   $password .= $charlist[int(rand($range))];
}
   print "Take your password:\n\n$password\n";
