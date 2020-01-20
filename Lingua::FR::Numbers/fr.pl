# Procedural Style
use Lingua::FR::Numbers qw(number_to_fr ordinate_to_fr);
print number_to_fr( 345 );
 
my $vingt  = ordinate_to_fr( 20 );
print "Tintin est reporter au petit $vingt";
 
# OO Style
use Lingua::FR::Numbers;
my $number = Lingua::FR::Numbers->new( 123 );
print $number->get_string;
print $number->get_ordinate;
 
my $other_number = Lingua::FR::Numbers->new;
$other_number->parse( 7340 );
$french_string = $other_number->get_string;
