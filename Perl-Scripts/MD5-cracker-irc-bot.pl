﻿#!/usr/bin/perl
#
# HOLLOW CHOCOLATE BUNNIES FROM HELL
#          presenting
#      BUNNY BOT Version 0.1
#
# by softxor
# softxor at info-sec.co.uk
# http://bunnies.rootyourbox.org/
# IRC: #hcbfh irc.milw0rm.com
#
# - Basic IRC connection capabilites (mainly the regex) ripped from preddy's bot.
# - Only tested with linux.
# - I'm not responsible for the things you do with this code.
#
#
# INSTALLING A DICTIONARY
# First of all you need a dictionary/wordlist file, that holds one password in each
# line.
# Because reading one large file takes up alot of memory, and thus makes the
# cracking very painful, it's the best way to split up your dictionary into
# small, little pieces. For this purpose use the split command (sry windows users):
#     split -l 200000 -d <dictionary> dict
# After you've done that adjust the variable $dict_num to the number of dictXX files
# the split command created.
# Maybe you should think about mounting the dictionary on a ram-fs.
#
#
# IMPLEMENTED COMMANDS
# 
# !info         - Prints content of the info file to user
# !md5 <text>        - Encrypts text to a md5 hash
# !crack <hash>        - Decrypts md5 hash using dictionary attack
# !say <target> <text>    - Sends test to target. Target can be a channel or nickname
# !join <channel>    - Forces bot to join the given channel
# !resolve <domain>    - Resolves a domain
# !wordlist        - shows number of known passwords
# !numdicts <number>    - adjusts the number of dictionary files during runtime
# OTHER FEATURES
#
# Flood protection    - If you dont want to enable flood protection set
#              $enable_flood_prot to 0

use Net::Ping;
use IO::Socket;
use Switch;
use Digest::MD5 qw(md5_hex);

# Configuration
$enable_flood_prot = 1;
$dict_num = 24;
$server = 'irc.milw0rm.com';
$port = '6667';
$user = 'bunnie bunnie bunnie bunnie'; # bunny madness ;)
$nick = 'bot';
$nickservpass = '';
$channel = '#hcbfh';
$owner = 'softxor';
$owner_vhost = 'ipt.aol.com'; # insert a part of the owners vhost here

print "Establishing connection with $server...";
$con = IO::Socket::INET->new(PeerAddr=>$server,
                             PeerPort=>$port,
                             Proto=>'tcp',
                             Timeout=>'30') || print "Error: Connection\n";
print "\t\t[DONE]\n";


# Loging in
print "Now logging in to IRC network...";
print $con "USER $user\r\n";
print $con "NICK $nick\r\n";
print $con "JOIN $channel\n";
print $con "privmsg nickserv IDENTIFY $nickservpass\r\n";
print "\t\t\t[DONE]\n";

pipe(IN, OUT) || die "Can't create pipe....\n";


# determine length of dictionary
print "Reading amount of passwords in dictionary...";
$num_passwds = 0;
for ($i = 0; $i <= $dict_num; $i++) {
    if ($i <= 9) {
        open(DICT, "dict0$i");
    } else {
        open(DICT, "dict$i");
    }
    @dict = <DICT>;
    foreach $line (@dict) {
        $num_passwds++;
    }
    close DICT;
}

print "\t\t[DONE]\nFound $num_passwds passwords.\n";


# fork action
print "Creating cracker process...";
OUT->autoflush(1);
IN->autoflush(1);

if (!fork) {
    close OUT;
    while($md5hash = <IN>) {
        chomp($md5hash);
        $found = 0;
        @tmp = split(":", $md5hash);
        $xnick = $tmp[1];
        $md5hash = $tmp[0];
        $type = $tmp[2];
        
        for ($j = 1; $j <= $dict_num; $j++) {
            if ($j <= 9) {
                open(DICT, "dict0$j");
            } else {
                open(DICT, "dict$j");
            }
            @dict = <DICT>;
            $starttime = time();
            foreach $i (@dict) {
                chomp($i);
                if ($md5hash eq md5_hex($i)) {
                    $duration = time() - $starttime;
                    print $con "privmsg $channel :cracked $md5hash $i in $duration seconds\n";
                    print $con "privmsg $xnick :cracked $md5hash $i in $duration seconds\n";
                    $found = 1;
                    break;
                }
            }
            
            close DICT;
            
            if ($found) {
                break;
            }
        }
        if (!$found) {
                $duration = time() - $starttime;
                print $con "privmsg $channel :$md5hash not found. $duration seconds needed.\n";
                print $con "privmsg $xnick :$md5hash not found. $duration seconds needed.\n";
        }
    }        
}
close IN;
print "\t\t\t\t[DONE]\nNow entering main loop....";

# main loop
while($answer = <$con>) {
print $answe;
if ($answer =~ m/^\:(.*?)\!(.*?)\@(.*?)\sPRIVMSG\s(.*?) :(.*?)$/) {
    $xnick = $1;
    $xident = $2;
    $xhost = $3;
    
    $xchannel = $4;
    $xtext = $5;
    @words = split(" ",$xtext);

    
    if($owner eq $xnick && $xhost =~ /$owner_vhost/) {
        # Owner is now recognized by the bot
        
        if($words[0] =~ m/\!exit/i) {
            print $con "privmsg $channel so long you suckers...\n";
            print $con "quit\n";
            die();
        }
        
        if($words[0] =~ m/\!say/i) {
            $target = $words[1];
            splice(@words, 0, 2);
            print $con "privmsg $target :@words\n";
        }
        
        #Join Command
        if($xtext =~ m/\!join/i) {
            if($words[1] =~ '#')
            {
                print $con "JOIN $words[1]\r\n";

                if(@words > 2) {
                    @joinmessage = split($words[1], $xtext);
                    $joinmessage[1] =~ s/ //;
                    print $con "privmsg $words[1] :$joinmessage[1]\n";
                }
            }
        }
    }
    
    
    # User commands
    
    # Info command
    if($words[0] =~ m/\!info/i) {
            open(DICT, "info");
            @info = <DICT>;
            foreach $line (@info) {
                print $con "privmsg $xnick :$line\n";
            }
    }
    

    if($words[0] =~ m/!crack/i) {
        if(length($words[1]) == 32) {
            print $con "privmsg $xnick :Added hash $words[1] to queue\n";
            print OUT $words[1].":$xnick\n";
        } else {
            print $con "privmsg $xnick :That's not a md5 hash.\n";
        }
    }


    # Resolve command
    if($words[0] =~ m/!resolve/i) {
        if(@words < 2) {
            print $con "privmsg $xchannel :!resolve [domain]\n";
        } else {
            $dadomain = $words[1];
            $daip = inet_ntoa(inet_aton($dadomain));
            print $con "privmsg $xchannel :$dadomain : $daip\n";
        }
    }
    
    # md5 encrypter command
    if($words[0] =~ m/!md5/i) {
        print $con "privmsg $xchannel :in md5: ".md5_hex($words[1])."\n";
    }
    
    # show size of wordlist    
    if($words[0] =~ m/!wordlist/i) {    
        print $con "privmsg $xchannel :There are currently $num_passwds passwords in my dictionary file\n";
    }
    
    # flood protection
    if ($enable_flood_prot) {
        if ($xnick eq $lastnick && (time() - $fltime) < 3) {
            $flood++;
        } else {
            $lastnick = $xnick;
            $flood = 0;
        }

        if ((time() - $fltime) > 10) {
        $flood = 0;
        }    
        $fltime = time();
        if ($flood >= 5) {
            print $con "MODE $xchannel +b $xnick!*@*$xhost\n";
            print $con "KICK $xchannel $xnick :no flooding!\n";        
        }
    }
} else {

    # Actions
    
    if($answer =~ m/^PING (.*?)$/gi) {
        print $con "PONG ".$1."\n";
    }
}
}
