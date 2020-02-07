#!/usr/bin/perl
# socks_checker_list-002.pl - Perl direct SOCKS server's list checker
# (c) feb 2007 @ b1ma a.k.a bima_
# for educational purposes only
# GPL v.2
#########################################


use strict;
use IO::Socket::Socks;

my $pret;
my $elemen;
my @prox;
my $socks;

open(UF, "<ceksocks.txt") || die "\nI can't open the list\n";
my @prox=<UF>;
close(UF);

foreach $elemen(@prox){
chomp($elemen);
$pret=$elemen=~/(.+)Sad.+)/;
if ($pret) {
#print "trying ip $1 port $2 ::: \t";


$socks = new IO::Socket::Socks( ProxyAddr=> "$1",
ProxyPort=> "$2",
ConnectAddr=> "irc.centrin.net.id",
ConnectPort=> "6667" ) ;

if (!defined $socks) {
printlog("[*] $1:$2\tFailure\n");
#next;
} else {
print $socks 'testing\n';
$socks->close();
printlog("[+] Sukses\t\t$1:$2\n");
}
} #of if

sleep 1;

} #of foreach


sub printlog {
print @_[0];
open(LO,">>socks_log2.txt");
print LO @_[0];
close(LO);
return;
} 