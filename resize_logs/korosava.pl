#!/usr/bin/perl
 use strict;
 use warnings;
 use diagnostics;
 use POSIX; #includes floor , ceil

#CHANGE PATH AND PREFERED FILE TYPE AND SIZE IN MB( NO FLOAT )
our @files = </home/user/path/toyour/logs/*>;
trimFiles('log',5);

#CHANGE PATH AND PREFERED FILE TYPE AND SIZE IN MB( NO FLOAT )
sub trimFiles {
    my $typePre = $_[0];
    my $sizePre = $_[1];
    my $size;
    my $count;
    my @arr_file;
    for (my $i = 0; $i < scalar @files; $i++) {
        # print "$files[$i]\n";
        my @small_arr = split /[\/.]+/, $files[$i];
        if($small_arr[-1] eq $typePre){
            $size = floor((-s $files[$i])/1000000);
               $count = `wc -l < $files[$i]`;
               die "wc failed: $?" if $?;
               chomp($count);
               $count = ($count/2).'d';
               if($size > $sizePre){
                    my $exec = system("sed -i 1,$count $files[$i]");
                    }
                }
            }
}
