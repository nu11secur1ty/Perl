﻿#!usr/bin/perl -w
#skankarar
use LWP::UserAgent;
use Digest::MD5 qw(md5_hex);
$uag = LWP::UserAgent->new;
$uag->agent('Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.3) Gecko/20070309 Firefox/2.0.0.4');
my $hash = "5d41402abc4b2a76b9719d911017c592";
my @proxy = ("http://anonymouse.org/cgi-bin/anon-www.cgi/");
#postcracked($hash);
#getcracked($hash);

sub postcracked{
my @url = ("http://www.securitystats.com/tools/hashcrack.php","http://www.hashchecker.com/index.php","http://md5crack.it-helpnet.de/index.php?op=search","http://www.md5decrypter.com/","http://md5pass.info");
my @posts = ("inputhash=" . $_[0] . "&type=MD5&Submit=Submit","search_field=" . $_[0] . "&Submit=search","md5=" . $_[0],"hash=" . $_[0] . "&submit=Decrypt%21","hash=" . $_[0] . "&get_pass=Get+Pass");
my @regexs = ("<BR>$_[0] = (.*?)<\/td>"," is <b>(.*?)<\/b> used charlist :","</td><td>$_[0]</td><td>(.*?)</td></tr></table>",">Normal Text: <\/b>(.*?)\n<br\/><br\/>","<b>(.*?)</b><script language=");
my $counter;
for ($counter=0; $counter<$#url + 1; $counter++){
my $req = HTTP::Request->new(POST => $proxy[0] . $url[$counter]);
$req->content_type('application/x-www-form-urlencoded');
$req->content($posts[$counter]);
my $res = $uag->request($req);
if ($res->is_success) {
	if($res->content =~ m/$regexs[$counter]/i){
		if(length($1) <1){
	print "Didn't find match\n";
}
else{
print "Found match: $1\nOn: $url[$counter]\n";
exit();
}
}
else {
print "Didn't find match\nOn: $url[$counter]\n";
}
}
else {
print $res->status_line, "\n";
}
}
}
sub getcracked{
my @geturls = ("http://md5.rednoize.com/?p&s=md5&q=" . $_[0],"http://www.gdataonline.com/qkhash.php?mode=txt&hash=" . $_[0],"http://nz.md5.crysm.net/find?md5=" . $_[0],"http://ice.breaker.free.fr/md5.php?hash=" . $_[0],"http://md5.xpzone.de/?string=" . $_[0] . "&mode=decrypt","http://md5.geeks.li/index.php?hash=");
my @getregexs = ("(.*?)<DIV id=","<b>(.*?)<\/b><\/td><\/tr>","<li>(.*?)<\/li>","<b><br><br> - (.*?)<br><br><br>","Code: <b>(.*?)</b><br>","Hash found: <br\/>(.*?):$_[0]<br\/>");
my $counter;
for ($counter=0; $counter<$#geturls + 1; $counter++){
my $req = HTTP::Request->new(GET => $proxy[0] . $geturls[$counter]);
$req->header(Accept => 'text/xml,application/xml,application/xhtml+xml,text/html');
my $res = $uag->request($req);
if ($res->is_success) {
	if($res->content =~ m/$getregexs[$counter]/i){
if(length($1) <1){
	print "Didn't find match\n";
}
else{
print "Found match: $1\nOn: $geturls[$counter]\n";
exit();
}
}
else {
print "Didn't find match\nOn: $geturls[$counter]\n";
}
}
else {
print $res->status_line, "\n";
}
}
print "Didn't find any matches at all";
}
