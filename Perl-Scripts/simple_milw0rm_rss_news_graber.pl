﻿#!/usr/bin/perl

use LWP::Simple;
use XML::Simple;
use Term::ANSIColor;

$content = get('http://milw0rm.com/rss.php');

$xml = XMLin($content);

$num = scalar(@{$xml->{channel}->{item}});

for ($i=0; $i<$num; $i++){

print
colored("\nDate: $xml->{channel}->{item}->[$i]->{pubDate}\n", 'yellow'),
colored("\nTitle: $xml->{channel}->{item}->[$i]->{title}\n", 'green'),
colored("\nLink: $xml->{channel}->{item}->[$i]->{link}\n\n\n", 'green');

}; 
