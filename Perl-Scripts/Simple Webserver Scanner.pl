#!/usr/bin/perl

use Socket;
use Strict;
use warnings;

my $remote = $ARGV[0];
my $port=80;

if ($ARGV[0] eq "") {
affichage();
}

sub affichage
{
        print "\n\nUsage : $0 <remote host>\n";
exit();
}



$submit = "HEAD / HTTP/1.0\r\n\r\n";
if($port =~ /\D/) { $port = getservbyname($port, 'tcp') }
die "no port specified" unless $port;
my $iaddr = inet_aton($remote) || die "$remote";
my $paddr = sockaddr_in($port, $iaddr) || die "Caca !!";
my $proto = getprotobyname('tcp') || die "protocol !!";

socket(SOCK, PF_INET, SOCK_STREAM, $proto) || die "cannot open socket 
+: $!";
connect(SOCK, $paddr) || die "cannot connect to $remote: $!";
send(SOCK,$submit,0);
while(<SOCK>)
{
if($_ =~ /Server: (.*)/) {
        print $_;
}

}
close(SOCK);