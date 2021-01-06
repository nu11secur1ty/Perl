# executing other languages
Yes, correct! I <3 Perl ;) For more information, please visit here ;)

[perlrun()][1]


  [1]: https://www.freebsd.org/cgi/man.cgi?query=perlrun&sektion=1&apropos=0&manpath=redhat

So you can test it:

execute in your terminal:

    cat > kk.sh << 'EOF'
    #!/bin/bash
    date
    EOF

then execute:
   
    perl kk.sh

And Another lang :D

execute in your terminal:

    cat > kk.php << 'EOF'
    #!/bin/bash
    echo "Hello Perl";
    EOF 

then execute:
   
    perl kk.php

The result is the same no matter what language you want to simulate.
If the `#!` line does not contain the word "Perl" nor the word "indir", the program named after the `#!` is executed instead of the Perl interpreter. This is slightly bizarre, but it helps people on machines that don't do `#!`, because they can tell a program that their SHELL is /usr/bin/perl, and Perl will then dispatch the program to the correct interpreter for them.
Yes, this is dangerous by the way! ;) Be careful!

BR =)

    



