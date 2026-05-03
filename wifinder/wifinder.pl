use strict;
use warnings;
use Win32;
use Encode qw(decode);

# nu11secur1ty

sub is_admin {
    # Returns 1 if admin, 0 otherwise
    return Win32::IsAdminUser();
}

sub run_as_admin {
    my $script = Win32::GetFullPathName($0);
    print "Elevation required. Requesting Administrator rights...\n";
    
    # Using PowerShell to restart the script as admin (native to Win 10/11)
    my $command = "powershell -Command \"Start-Process perl -ArgumentList '$script' -Verb RunAs\"";
    system($command);
    exit;
}

sub get_wifi_passwords {
    # Get all profiles
    my $profiles_raw = `netsh wlan show profiles`;
    # CP1251 handles Bulgarian/Cyrillic in Windows console
    my $profiles_data = decode('cp1251', $profiles_raw);
    
    my @ssids = $profiles_data =~ /:\s(.*)/g;
    
    print "\n" . sprintf("%-3s | %-30s | %-20s", "#", "SSID (Network Name)", "Password") . "\n";
    print "-" x 65 . "\n";
    
    my $count = 1;
    foreach my $name (@ssids) {
        $name =~ s/\s+$//; # Trim trailing whitespace
        $name =~ s/\r$//;  # Trim carriage return
        next if $name =~ /---/ or $name eq "";
        
        # Get password for each profile (surround $name with quotes for spaces)
        my $info_raw = `netsh wlan show profile name=\"$name\" key=clear`;
        my $info = decode('cp1251', $info_raw);
        
        my $pass = "-- Open / Enterprise --";
        # Match both English "Key Content" and Bulgarian "Съдържание на ключа"
        if ($info =~ /(?:Key Content|Съдържание на ключа)\s*:\s(.*)/) {
            $pass = $1;
            $pass =~ s/\s+$//;
            $pass =~ s/\r$//;
        }
        
        printf("%-3d | %-30s | %-20s\n", $count++, $name, $pass);
    }
}

sub main {
    if (!is_admin()) {
        run_as_admin();
    }

    print "--- nu11secur1tyAI WiFi Scanner (Perl Version) ---\n";
    print "Working Directory: " . Win32::GetCwd() . "\n";
    print "System: Windows 11\n";

    get_wifi_passwords();

    print "\nPress Enter to exit...";
    <STDIN>;
}

main();
