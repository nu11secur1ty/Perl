﻿#!/usr/local/bin/perl
print "\nMakeBrute \n     By Drusepth\n";
print "This program will create a wordlist in the current directory for for use\nin brute forcing (not dictionary) attacks with the name brute.txt.  This wordlist ends up being around 175MB.\n  Press any key to continue, or close the program to prevent making the list.";
$continizzle = <STDIN>;
print "Working...  This may take a while.  \n";
open (BRUTE, ">brute.txt");
#Start writing to the file:
#Brute Force List
$brute = "a"; #Set $brute to 'a' to begin with.
for ($force = 1; $force < 28000000; $force++) { #$force is how many times it will increment
   print BRUTE "$brute\n"; #Print the current $brute out.
   if (ord(substr($brute, -1, 1)) == "122") { #If the last character is 'z',
      if (length($brute != 1)) { #If $brute is more than 1 character long,
         if (ord(substr($brute, -2, 1)) != "122") { #If the last character is 'z' and the second isn't,
            #If the last letter is 'z', but the second-to-last isn't,
            substr($brute, -1, 1) = "a"; #Set the last character as 'a'.
            if (length($brute) > 1) { #If $brute is 2 or more letters long already,
               substr($brute, -2, 1) = chr(ord(substr($brute, -2, 1)) + 1); #Increment the tenth-to-last.
            } else { #If $brute is 2 letters long,
               $brute = "a".$brute; #Attach 'a' to the left.
            }
         }
         #These next if statements are cumulative; you have to have one true to get to the next.
         if (ord(substr($brute, -2, 1)) == "122") { #If the second-to-last character is 'z',
         if (ord(substr($brute, -3, 1)) == "122") { #If the third-to-last-character is 'z',
         if (ord(substr($brute, -4, 1)) == "122") { #If the fourth-to-last-character is 'z',
         if (ord(substr($brute, -5, 1)) == "122") { #If the fifth-to-last-character is 'z',
         if (ord(substr($brute, -6, 1)) == "122") { #If the sixth-to-last-character is 'z',
         if (ord(substr($brute, -7, 1)) == "122") { #If the seventh-to-last-character is 'z',
         if (ord(substr($brute, -8, 1)) == "122") { #If the eighth-to-last-character is 'z',
         if (ord(substr($brute, -9, 1)) == "122") { #If the ninth-to-last-character is 'z',
         if (ord(substr($brute, -10, 1)) == "122") { #If the tenth-to-last-character is 'z' (the first letter)
            die ("Finished.\n"); #Exit the program; you wrote all 23,762,752 combinations plus some more numbers!  :o
         }
         #If the ninth-to-last letter is 'z', but the tenth-to-last isn't,
         substr($brute, -9, 1) = "a"; #Set the ninth-to-last as 'a'.
         if (length($brute) > 9) { #If $brute is 10 or more letters long already,
            substr($brute, -10, 1) = chr(ord(substr($brute, -10, 1)) + 1); #Increment the tenth-to-last.
         } else { #If $brute is 9 letters long,
            $brute = "a".$brute; #Attach 'a' to the left.
         }
         }
         #If the eighth-to-last letter is 'z', but the ninth-to-last isn't,
         substr($brute, -8, 1) = "a"; #Set the eighth-to-last as 'a'.
         if (length($brute) > 8 ) { #If $brute is 9 or more letters long already,
            substr($brute, -9, 1) = chr(ord(substr($brute, -9, 1)) + 1); #Increment the ninth-to-last.
         } else { #If $brute is 8 letters long,
            $brute = "a".$brute; #Attach 'a' to the left.
         }
         }
         #If the seventh-to-last letter is 'z', but the eighth-to-last isn't,
         substr($brute, -7, 1) = "a"; #Set the seventh-to-last as 'a'.
         if (length($brute) > 7) { #If $brute is 8 or more letters long already,
            substr($brute, -8, 1) = chr(ord(substr($brute, -8, 1)) + 1); #Increment the eighth-to-last.
         } else { #If $brute is 7 letters long,
            $brute = "a".$brute; #Attach 'a' to the left.
         }
         } 
         #If the sixth-to-last letter is 'z', but the seventh-to-last isn't,
         substr($brute, -6, 1) = "a"; #Set the sixth-to-last as 'a'.
         if (length($brute) > 6) { #If $brute is 7 or more letters long already,
            substr($brute, -7, 1) = chr(ord(substr($brute, -7, 1)) + 1); #Increment the seventh-to-last.
         } else { #If $brute is 6 letters long,
            $brute = "a".$brute; #Attach 'a' to the left.
         }
         }
         #If the fifth-to-last letter is 'z', but the sixth-to-last isn't,
         substr($brute, -5, 1) = "a"; #Set the fifth-to-last as 'a'.
         if (length($brute) > 5) { #If $brute is 6 or more letters long already,
            substr($brute, -6, 1) = chr(ord(substr($brute, -6, 1)) + 1); #Increment the sixth-to-last.
         } else { #If $brute is 5 letters long,
            $brute = "a".$brute; #Attach 'a' to the left.
         }
         }
         #If the fourth-to-last letter is 'z', but the fifth-to-last isn't,
         substr($brute, -4, 1) = "a"; #Set the fourth-to-last as 'a'.
         if (length($brute) > 4) { #If $brute is 5 or more letters long already,
            substr($brute, -5, 1) = chr(ord(substr($brute, -5, 1)) + 1); #Increment the fifth-to-last.
         } else { #If $brute is 5 letters long,
            $brute = "a".$brute; #Attach 'a' to the left.
         }
         }
         #If the third-to-last letter is 'z', but the fourth-to-last isn't,
         substr($brute, -3, 1) = "a"; #Set the third-to-last as 'a'.
         if (length($brute) > 3) { #If $brute is 4 or more letters long already,
            substr($brute, -4, 1) = chr(ord(substr($brute, -4, 1)) + 1); #Increment the fourth-to-last.
         } else { #If $brute is 4 letters long,
            $brute = "a".$brute; #Attach 'a' to the left.
         }
         }
         #If the second-to-last letter is 'z', but the third-to-last isn't,
         substr($brute, -2, 1) = "a"; #Set the second-to-last as 'a'.
         if (length($brute) > 2) { #If $brute is 3 or more letters long already,
            substr($brute, -3, 1) = chr(ord(substr($brute, -3, 1)) + 1); #Increment the third-to-last.
         } else { #If $brute is 3 letters long,
            $brute = "a".$brute; #Attach 'a' to the left.
         }
         }
      }
      if (length($brute == 1)) { #If the whole string is 'z',
         $brute = "aa"; #This condition is special, like me.
         $stop = "1";
      }
   }
   if (ord(substr($brute, -1, 1)) != "122") { #If the last character isn't 'z',
      substr($brute, -1, 1) = chr(ord(substr($brute, -1, 1)) + 1) #Increment the last letter.
   }
}
print "\n"; #The program finished.
#Cumulative letters:
for ($char = 97; $char < 123; $char++) {
   for ($mult = 0; $mult < 10; $mult++) {
      $temp = $temp.chr($char);
      print BRUTE "$temp\n";
   }
   $temp = ""
}
#Cumulative numbers:
$zero = "0";
print BRUTE "$zero\n";
for ($b = 0; $b < 10; $b++) {
   $zero = "$zero"."0";
   print BRUTE "$zero\n";
}
$one = "1";
print BRUTE "$one\n";
for ($b = 0; $b < 10; $b++) {
   $one = "$one"."1";
   print BRUTE "$one\n";
}
$two = "2";
print BRUTE "$two\n";
for ($b = 0; $b < 10; $b++) {
   $two = "$two"."2";
   print BRUTE "$two\n";
}
$three = "3";
print BRUTE "$three\n";
for ($b = 0; $b < 10; $b++) {
   $three = "$three"."3";
   print BRUTE "$three\n";
}
$four = "4";
print BRUTE "$four\n";
for ($b = 0; $b < 10; $b++) {
   $four = "$four"."1";
   print BRUTE "$four\n";
}
$five = "5";
print BRUTE "$five\n";
for ($b = 0; $b < 10; $b++) {
   $five = "$five"."5";
   print BRUTE "$five\n";
}
$six = "6";
print BRUTE "$six\n";
for ($b = 0; $b < 10; $b++) {
   $six = "$six"."6";
   print BRUTE "$six\n";
}
$seven = "7";
print BRUTE "$seven\n";
for ($b = 0; $b < 10; $b++) {
   $seven = "$seven"."7";
   print BRUTE "$seven\n";
}
$eight = "8";
print BRUTE "$eight\n";
for ($b = 0; $b < 10; $b++) {
   $eight = "$eight"."8";
   print BRUTE "$eight\n";
}
$nine = "9";
print BRUTE "$nine\n";
for ($b = 0; $b < 10; $b++) {
   $nine = "$nine"."9";
   print BRUTE "$nine\n";
}

#The numbers 1 through 9999:
@counting = (0 .. 9999);
for ($a = 0; $a < 10000; $a++) {
   print BRUTE "$counting[$a]\n";
}
close (BRUTE);
print "Done!\n\n"; 
