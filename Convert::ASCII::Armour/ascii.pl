#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;
use Convert::ASCII::Armour; 

my $converter = new Convert::ASCII::Armour; 
 
my $message   = $converter->armour( 
                    Object   => "Tarator RECORD", 
                    Headers  => { 
                                  Table   => "Tarator", 
                                  Version => "1.23", 
                                },
                    Content  => { 
                                  Key  => "Krastavici", 
                                  Name => "nu11secur1ty",
                                  Pic  => ".....",  # gif 
                                },
                    Compress => 1,
                );
 
print "$message\n\n\n";

my $decoded   = $converter->unarmour( $message ) 
                 || die $converter->errstr();
                 print "$decoded\n";
