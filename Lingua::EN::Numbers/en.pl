use Lingua::EN::Numbers qw(num2en num2en_ordinal);
 
my $x = 234;
my $y = 54;
print "You have ", num2en($x), " things to do today!\n";
print "You will stop caring after the ", num2en_ordinal($y), ".\n";
