#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;
use Convert::ASCII::Armour; 

my $converter = new Convert::ASCII::Armour; 
 
my $message   = $converter->armour( 
                    Object   => "FOO RECORD", 
                    Headers  => { 
                                  Table   => "FooBar", 
                                  Version => "1.23", 
                                },
                    Content  => { 
                                  Key  => "0x8738FA7382", 
                                  Name => "Zoya Hall",
                                  Pic  => "....",  # gif 
                                },
                    Compress => 1,
                );
 
print $message; 
