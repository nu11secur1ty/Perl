﻿#!/usr/bin/perl
#
#ircbot <= 0.01 irc spam bot
#
#© 2004-2006 Esoteric Code
#simple spam bot for irc. has a timer
#for sending message which works in a for loop
#written by: seven


use IO::Socket;
$channel ="#channel name";
$Host = "irc.server.net";
$Port = 6667;
$nick = "seven";
$email = "code 8 * :esotericcode.com";

@alternate = ('amen_Ra',
              'seven',
              'basic_code');

@resp = ('I am a IRC bot coded in perl.', #random spam messages
         'visit http://www.sevenz.net.',
         'hey, how are you.',
         'esoteric code.com.',
         'how was your day?',
         'hey, blow me',
         'i am sexier than you');


my $sock = new IO::Socket::INET(
                                PeerAddr => $Host,
                                PeerPort => $Port,
                                Proto => 'tcp',
                               ) || die "No connection $!\n";

print $sock "NICK $nick\r\n";
print $sock "USER $email\r\n";

while ($input = <$sock>)
{
  if ($input =~ /004/){
    last;
  }
  elsif ($input =~ /433/){
                    #nick already taken, auto switch to an alternate randomly from list
                    $a = int(rand($#alternate));
                    $newnick = $alternate[$a];
                    print $sock "NICK $newnick\r\n";     
  }
 
}
    print $sock "JOIN $channel\r\n";                
                   
while ($input = <$sock>)
{
    chop $input;
    if ($input =~/^PING(.*)$/i){
        print $sock "PONG $1\r\n";
        print $sock "PRIVMSG $channel :irc bot coded in perl -> http://www.sevenz.net\r\n";
    }

     elsif ($input =~/!start(.*)/){

        for ($i = 0; $i < 20; ++$i)
        {
        $r = int(rand($#resp));
        $message = $resp[$r];
        print $sock "PRIVMSG $channel :$message\r\n";
        sleep(10)
        }
       
    }
      elsif ($input =~/!time(.*)/){
        $time = time();
        print $sock "PRIVMSG $channel :local time/date: $time\r\n";
    }
    else{
    #@tmp = split(/:/, $input);
    print $input #$tmp[1]
}
    
}

