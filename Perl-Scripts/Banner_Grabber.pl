﻿#!/usr/local/bin/perl
####################
# gets web Server Version
#    Usage:
#        MBG_0.1.pl -h yahoo.com -p 80
#        MBG_0.1.pl -h file.txt -p 80
#
####################

##### MODS
use IO::Socket::INET; # XXX should really use Socket; here.. I'm lazy
use Getopt::Std;

##### SUBROUTINES
sub INTRO {
        &GETVARS;
        print "\n$0 by RS\n\n";
}

sub GETVARS {
        getopt(hpfomut);
        # Check for $host or $host_file, run &USAGE if not there
        if ($opt_h) {
                push(@hosts,$opt_h);
        } elsif ($opt_f) {
    # Check if they want to grab hosts from a file
        $host_file = "$opt_f";
        &GETHOSTS
        } else {
                &USAGE;
    }
    # output to file?
    if ($opt_o) {
        $out_file = $opt_o;
    }
        # Check for port, or set default 80
        if ($opt_p) {
                $port = "$opt_p";
        } else {
                $port = "80";
        }
    if ($opt_t) {
        $timeout = "$opt_t";
    } else {
        $timeout = "6";
    }
    # method for request
    if ($opt_m) {
        $method = "$opt_m";
    } else {
        $method = "HEAD"
    }
    # check for path/file
    if ($opt_u) {
        $file = "$opt_u";
    }
    # raw mode
    if ($opt_r) {
        $raw = "1";
        $recv_size = "2000";
    } else {
        $recv_size = "200";
    }
    # verbose
    if ($opt_v) {$verbose = "1"}    
}

sub USAGE {
        print "\n$0 -h hostname -p port -f input-file -o output-file -t timeout -m method -u filepath -rv\n\n";
        exit;
}

sub GETHOSTS {
    open (HOSTS,"<$host_file") or die "** problem with $host_file: $!!\n"; 
    while ($line = <HOSTS>) {
        chomp $line;
        push(@hosts,$line);
        if ($verbose) {print "Got $line from infile\n";}
    }
    if ($#hosts < 1) {print "dood.. your lame\n";}
}

sub REMOVESHIT {
    # Split fungus up, so each newline is a seperate element in our array
    # This is so we can grab the info we want, and toss the rest
    @datar = split(/\n/, $fungus);

    # Check all the lines we got from the web server
    # We only want ones that contain the string "Server"
    foreach $i (@datar) {
            $toejam = $i if ($i =~ /Server/);
        }

    # This ugly little bit gets rid of the html tags around our data
    $_ = $toejam;
    s/<ADDRESS>*//;
    s/<\/ADDRESS>//;
    $toejam = $_;
}

##### MAIN - GO GET THE FUNGUS MANG!!!!!
&INTRO();

$stinkstring = "$method \/$file HTTP\/1.0"; # heh... got low pro?
if ($verbose) {print "Request will be \"$stinkstring\"\n";}
$stinkstring .= "\r\n\r\n";

foreach $host (@hosts) 
{
    if ($verbose) {print "starting to scan $host\n";}
    # Initiate our socket
    $smelly_sock = new IO::Socket::INET (
                PeerAddr => $host,
                PeerPort => $port,
                Timeout => $timeout, # 6s socket time out, change to your tastes
                Proto => 'tcp');
    # If we did not connect no point in going on
    if (!$smelly_sock) {print "** problem with SOCKET on $host: $!\ngoing to next host\n";next;}
    if ($verbose) {print "Succes! Our smelly sock(et) is connected to $host!\n";}

    # Send our string to the web server
    print $smelly_sock $stinkstring;

    # Grab the web servers reply into var $fungus, up to a 1000 bytes
    read $smelly_sock, $fungus, $recv_size;

    if (!$raw) {
        &REMOVESHIT;
    } else {
        $toejam = $fungus;
    }

    if ($out_file) 
    {
        # print to our file
        open(OUT,">>$out_file") or die "** problem with $out_file: $!!\n";
        print OUT "$host|$toejam|\n";
        close OUT;
    } else {
        # Print out to STDOUT
                print "----------------------------------------------------\n";
                print "The web server is responded: \n$toejam\n";
                print "----------------------------------------------------\n\n";
    }

    # Make sure we clean up after our selves!!!
    close $smelly_sock;
}
if ($verbose) {print "\nall done.\n";}
