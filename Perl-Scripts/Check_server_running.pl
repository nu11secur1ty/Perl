﻿#!/usr/bin/perl

use IO::Socket;

if(@ARGV<1)
{
usage();
}

my $sock = new IO::Socket::INET (
PeerAddr => $ARGV[0],
PeerPort => 80,
Proto => 'tcp',
)or die "Couldn't connect the host";

print $sock "HEAD / HTTP/1.0\n\n";


while ($line=<$sock>)
{

if($line =~/^Server/)
{


@arr=split("Server: ", $line);
print"\r\n$ARGV[0] runs $arr[1]";
exit(1);

    }
}




close($sock);

sub usage
{

print"HTTP Server Checker version 1.0\n";
print"Coded by squall\n";
print"usage: <host name>";
exit(0);

}
