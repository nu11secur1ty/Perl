#!/usr/bin/perl
# venvaropt
use strict;
use warnings;
use diagnostics;

	print "Users\n";
		our $user_find = `w`;
			print "$user_find\n";
	print "Users TTY-pts/x\n";
	        our $pts = <>;
		our $find_pts = `ps -ft $pts`;
			print "$find_pts\n";

        print "Proccess?\n";
our $search_proc = <>;
our $proc = `pgrep -f $search_proc`;
	print "$proc\n";
	print "PID?\n";
our $pid = <>;
our $diagnoze_pid = `ps -auxf | grep $pid`;
	print "$diagnoze_pid\n";
    exit 0;
