#!/usr/bin/perl

use strict;
use warnings;
use Net::Ping;
my $host;
my $pinger;

main(@ARGV);

sub main{
print "
                                                    
oo____oo_____ooooooo__________oooo________oo____oo_____oooo_____oooooooo_____ooooooo_
oo___oo______oo____oo_______oo____oo______oo___oo_______oo_________oo________oo______
oo__oo_______oo____oo______oo______oo_____oo__oo________oo_________oo________oooo____
oooooo_______ooooooo_______oo______oo_____oooooo________oo_________oo________oo______
oo___oo______oo____oo_______oo____oo______oo___oo_______oo_________oo________oo______
oo____oo_____oo_____oo________oooo________oo____oo_____oooo________oo________ooooooo_
_____________________________________________________________________________________

";
	print "[+] Please Report any Bug to http://krokite.com\n";
	print "[+] Also, If you like to discuss about security and pentesting than please do visit us\n";
	print " @ http://board.blackbuntu.com\n";
	print "[+] Check whether Site is Alive or not, Or if you are able to ping the website\n";
	print "[+] Please Enter Website Name \n";
	$host = <stdin>;
	chomp($host);
	$pinger = Net::Ping->new("icmp", 1, 64);
	if ($pinger->ping($host)) {
		print "[=] $host is up\n";
	} else {
		print "[=] $host is down\n";
		print "[+] Please note in some cases, host may be blocking your Request"."\n";
	}
}
