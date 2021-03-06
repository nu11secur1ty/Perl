﻿#!/usr/bin/perl
use warnings;
use strict;

# dirbf.pl usage:
# ./dirbf.pl <http://127.0.0.1> -i=<file> -p=<proxy> -e=<ext1:ext2:ext3>
# if -i is set the script will test against the lines in <file>
# if -p is set the script passes traffic thru <proxy>
# if -e is set the script will also look for files ending in extensions specified. You can specify more estensions, use : to seperate them (php:html:txt)

use LWP::UserAgent;
use LWP::ConnCache;
my $a = LWP::UserAgent->new;
$a->conn_cache(LWP::ConnCache->new());  # speed up connection
$a->agent("W3C_Validator/1.432.2.10");  # ...disquise ready
$a->timeout(0);                         # no timeout
my ($proxy, $input, $ext, $url, $res, $d);
my (@dir, @ext);

$url = shift(@ARGV) or die("Usage: $0 <taget> <options>\n");

foreach ( @ARGV ) {
        if ( /-p=(.*)/ ) {
                $proxy = $1;
        } elsif ( /-i=(.*)/ ) {
                $input = $1;
        } elsif ( /-e=(.*)/ ) {
                $ext = $1;
        }
}

if ( $input ) {
        open(FP, $input) or die("Cannot open file <$input>\n");
        @dir = <FP>;
        chomp(@dir);
} else {
        @dir = qw(admin administration administrace backup root login members code src img image images text data hidden css js lib library inc include includes cpanel mpanel log logs);
}

if ( $proxy ) {
        $a->proxy(['http','ftp'], $proxy);
        $a->no_proxy('localhost','127.0.0.1');
}

foreach ( @dir ) {
        $res = $a->get("$url/$_");
        if ( &success( $res ) ) {
                print "$_\n";
        }

        $res = $a->get("$url/_$_");
        if ( &success( $res ) ) {
                print "_$_\n";
        }
}

if ( $ext ) {
        @ext = split(/:/, $ext);
        foreach $d ( @dir ) {
                foreach ( $ext ) {
                        $res = $a->get("$url/$d.$_");
                        if ( &success( $res ) ) {
                                print "$d.$_\n";
                        }
                }
        }
}

$res = $a->get("$url/robots.txt");
if ( $res->is_success ) {
        print "-"x20,"\n",$res->content,"-"x20,"\n";
} else {
        print "No robots.txt file at <$url>\n";
}

sub success {
        my ($res) = @_;
        if ( $res->status_line eq "HTTP/1.x 302 Found" ) {
                return 0;
        } elsif ($res->is_success || $res->status_line eq "403 Forbidden") {
                return 1;
        }
        return 0;
} 
