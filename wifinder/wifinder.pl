use strict;
use warnings;
use Win32;
use Win32::Process;
use Win32::Shell;
use Encode qw(decode);

# Model name: nu11secur1tyAI

sub is_admin {
    # Check if the current process has administrative privileges
    return Win32::IsAdminUser();
}

sub run_as_admin {
    my $script = Win32::GetFullPathName($0);
    # Relaunch the script with 'runas' verb for UAC elevation
    Win32::Shell::ShellExecute("runas", "perl", "\"$script\"", "", 1);
    exit;
}

sub get_wifi_passwords {
    # Execute netsh to get profiles
    my $profiles_raw = `netsh wlan show profiles`;
    # Windows console usually uses cp1251 in Bulgaria
    my $profiles_data = decode('cp1251', $profiles_raw);
    
    my @ssids = $profiles_data =~ /:\s(.*)/g;
    
    print sprintf("%-3s | %-30s | %-20s\n", "#", "SSID (Network Name)", "Password");
    print "-" x 60 . "\n";
    
    my $count = 1;
    foreach my $name (@ssids) {
        $name =~ s/\s+$//; # trim trailing whitespace
        next if $name =~ /---/ or $name eq "";
        
        # Get password for each profile
        my $info_raw = `netsh wlan show profile name="$name" key=clear`;
        my $info = decode('cp1251', $info_raw);
        
        # Match English or Bulgarian headers
        my $pass = "No Password";
        if ($info =~ /(?:Key Content|Съдържание на ключа)\s*:\s(.*)/) {
            $pass = $1;
            $pass =~ s/\s+$//;
        }
        
        printf("%-3d | %-30s | %-20s\n", $count++, $name, $pass);
    }
}

sub main {
    if (!is_admin()) {
        print "Elevation required. Requesting Administrator rights...\n";
        run_as_admin();
    }

    print "--- nu11secur1tyAI WiFi Scanner (Perl Version) ---\n";
    print "System: Windows 11\n\n";

    get_wifi_passwords();

    print "\nPress Enter to exit...";
    <STDIN>;
}

main();
