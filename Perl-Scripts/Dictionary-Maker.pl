﻿#!/usr/bin/perl
#WordMake 0.2: Dictionary Maker based on text files input
#Takes as input raw text files an parses them as dictionary files
#Features: 
#		Select as many raw texts as you like
#		Choose words between a specified long
#		Choose an output File		 	
#		Sorts all the words, makes them lowercase and unique
#		
#That's all I was looking in order 		
#to make a better Spanish Dictionary		
#If you find it useful, drop me a line and if 
#you want send me your dictionary		
#ToDO: Better cmd line parsing, more regular expresion filters, etc
#Of course if you make it better, let me know			     
#Author: Linga<linga@mailandnews.com>
#Date (Start of the Project): 25-05-00
#Last Modified: 27-05-00
#BugFixes: 
#From 0.1 max and min command line parameters where ignored because of a mistype in variables.
#Changes: 
#From 0.1 Now also accepts a hole directory where all the text files to be processed are.
#Usage: ./wordmake.pl TEXT_FILE_1 TEXT_FILE_2 ... TEXT_FILE_N [-o OUTPUT_FILE] [-min MIN_WORD_LENGTH] [-max MAX_WORD_LENGTH] [-txtdir DIR_WHERE_TXTs_ARE]
#Defaults... May be changed in the command line

$min_long=4;
$max_long=14;
$fout="dict_clean.txt";

#begin parsing arguments at the command line...
$i=0;
$m=0;
while($ARGV[$i]){
    if($ARGV[$i] eq "-o"){
    $i++;
    $fout=$ARGV[$i];
    $i++;
    }
    elsif($ARGV[$i] eq "-min"){
    $i++;
    $min_long=$ARGV[$i];
    $i++;
    }
    elsif($ARGV[$i] eq "-max"){
    $i++;
    $max_long=$ARGV[$i];
    $i++;
    }
    elsif($ARGV[$i] eq "-txtdir"){
    print "entro al bucle";
    $i++;
    $txt_dir=$ARGV[$i];
    $i++;
    $use_dir=1;
    print "salgo al bucle";    
    }
    else{
    $rawfiles[$m]=$ARGV[$i];
    $i++;$m++;
    }
}
print "Llegue aca";
open( DICT, ">$fout") or die "Can't open output file $fout...";
if ($use_dir){
    opendir(DIRTXT,$txt_dir) or die "Can't access dir.. check perms...";
    @rawfiles=(@rawfiles,readdir(DIRTXT));
    closedir (DIRTXT);
}
print @rawfiles;
foreach $raw_dict (@rawfiles){
	if($raw_dict ne "." || $raw_dict ne ".." || $raw_dict ne "wordmake0.2.pl"){
		open( RAW,$raw_dict) or die "Could't open input file $raw_dict\n";
		while (<RAW>) {
		  for (split) {
			$_=~tr/A-Z/a-z/;
			@a=m/\w{$min_long,$max_long}/g;
			if($a[0]){
				$count{$a[0]}++;
			}
		  }
		}
		close (RAW);
	}
}
foreach $key (sort keys %count){
print DICT "$key\n";
}
close (DICT);
