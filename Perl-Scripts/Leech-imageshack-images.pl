﻿#!/usr/bin/perl -w
use strict;
use WWW::Mechanize;

#Create an Object
my $mech = WWW::Mechanize->new();


foreach my $number ("0" .. "100") {
#Url to search images on.
my $url = "http://img301.imageshack.us/my.php?image=$number.jpg";

#Request webpage
$mech->get( $url );

#Search for links containing .jpg or .jpeg extensions
#in the url.
#Everything in between qr/ / is what to search for
#The . means any character usually but we use \ to escape it
# and make it literal. Then we did (jpe?g) which means to search for
#the text jpg or jpeg.
# The $ character means the end of the line/string.
# The i at the end means make everything case insensitive
 
my $link;
if ($link = $mech->find_link(tag => "a", url_regex => qr/\.(jpe?g)$/i)) {
    $mech->get($link);

    my $lurl = $link->url;
   
    #Take done.php?l=img301 out of the URL and replace with img301/
    $lurl =~ s/done\.php\?l\=img301\//img301\//;
   
    #Save image to file
    $mech->get( $lurl, ":content_file" => "$number.jpg");
}
else {
    print "Image $number.jpg not found\n";
   }
}
