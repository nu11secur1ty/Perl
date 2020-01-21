#!/usr/bin/perl 
  
# Perl Program to calculate Factorial  
sub fact 
{ 
      
# Retriving the first argument  
# passed with function calling 
my $x = $_[0]; 
  
# checking if that value is 0 or 1 
if ($x == 0 || $x == 1) 
{ 
    return 1; 
} 
  
# Recursively calling function with the next value 
# which is one less than current one 
else
{ 
    return $x * fact($x - 1); 
} 
} 
  
# Driver Code 
$a = 5; 
  
# Function call and printing result after return 
print "Factorial of a number $a is \n", fact($a);
