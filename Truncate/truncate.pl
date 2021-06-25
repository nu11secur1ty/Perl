#!/usr/bin/perl
############################
# copyright @ nu11secur1ty #
#      root program        #
############################
use strict;
use warnings;
use Term::ANSIColor;
   print "\n";
   print colored(['green'], "Write the exact name of the file, who you search for!, example:...'yourfile.txt'... \n");
   print colored(['red'], 'NOTE: use * in the end of the file to find all files with this name, example:...yourfile*...', "\n");
  
my $file_name=<STDIN>;
my $find_file=`find / -type f -name $file_name`;
       print colored(['red'], "Please put the full path to the file, and press enter...\n");
       print colored(['blue'],"$find_file\n");
       print "Type full path to the file:...\n";
       print "If you don't want to truncate a file, please press Ctrl+C:...\n";
my $full_path=<STDIN>;
my $truncate=`cat /dev/null > $full_path`;
       print colored(['yellow'],"Check your file, if he is Truncated!\n");
       print colored(['yellow'], "Goodbye, and welcome again next time =)\n");
exit;
