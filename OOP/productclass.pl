#!/usr/bin/perl
use strict;
use warnings;

use Product;

my $iphone = Product->new({
                          serial =>"100",
                          name => "iPhone 5", 
                  price => 650.00});
