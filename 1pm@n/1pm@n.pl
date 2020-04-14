#!/usr/bin/perl
# by @nu11secur1ty
# https://www.cisco.com/c/en/us/support/docs/ip/routing-information-protocol-rip/13788-3.html

use strict;
use warnings;
use warnings;

print "Give your network...\n";
print "For example: 192.168.1\n";

chomp (our $IP_range = <STDIN>);
for ( my $i = 0; $i < 255; $i++ ){
        print "$IP_range.$i\n";
}
