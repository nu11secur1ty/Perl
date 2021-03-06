﻿#!/usr/local/bin/perl
#DESBreak by Drusepth
print "Menu:\n>1-Encrypt A String into DES\n>2-Decrypt A String\n>3-How This Program Works\n";
print "Enter your choice.  >";
$choice = <STDIN>;
if ($choice == 1) {
   #Encrypt a String
   print "Enter the string to encrypt with DES.  ";
   $encrypt = <STDIN>;
   $tempe = $encrypt;
   print "Enter two letters to use as a salt to encrypt with: ";
   $saltines = <STDIN>;
   $encrypt = (crypt ($encrypt, $saltines));
   chop ($tempe);
   chop ($saltines);
   print "The string $tempe encrypts to $encrypt with the salt $saltines.\n";
}
if ($choice == 2) {
   #Decrypt a String
   print "Enter the string to decrypt:  ";
   $decrypt = <STDIN>;
   $salt = substr($decrypt, 0, 3);
   chop ($salt);
   chop ($decrypt);
   print "Enter the name of the external wordlist to use.\nLeave blank to use the default.  ";
   $ewordlist = <STDIN>;
   #Open a wordlist,
   chop ($ewordlist);
   if (length($ewordlist) > 0) {
      open (WORDLIST, "$ewordlist");
      @wordlist = <WORDLIST>;
   }
   if (length($ewordlist) == 0) {
      print "Opening default wordlist... \n";
      if (open (WORDLIST, "words.txt")) {
         print "Opened successfully.\n";
      } else {
         print "Couldn't open words.txt in this directory!";
      }
      @wordlist = <WORDLIST>;
   }
   #Start cracking!
   $counter = 1;
   for ($i = 0; $i < @wordlist; $i++) {
      $counter++;      
      $dec = $wordlist[$i];
      chop ($dec);
      if (crypt ($dec, $salt) eq $decrypt) {
         close (WORDLIST);
         die ("\nThe string $decrypt decrypts to $dec .\n");
      }
   }
   #If you run out of words on the wordlist...
   die ("\nThe decryption failed.  This may be caused by an insufficient wordlist\nfor your causes,a wrong inputted string, or maybe a typo. Program killed");
}
if ($choice == 3) {
   #How this program works
   print "\nThe encryption in this program uses Perl's built-in function of 'crypt'.\n";
   print "However, decrypting DES is a lot harder than encrypting it.\n";
   print "The way I have chosen to decrypt the strings is to encrypt a wordlist and\n";
   print "compare the wordlist encryption and the inputted string encryption.\n";
   print "If they are equal, then the program decrypts the word again, and displays\n";
   print "what the word is.  This may or may not take a while, depending on\n";
   print "the encrypted word's 'password strength' and the size of your wordlist.\n";
   print "The wordlist is your strength.  Use a good one.\n";
   print "The included script, makebrute.pl, will generate a brute forcing word \nlist for you.\n\n";
} 
