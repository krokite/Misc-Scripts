#!/usr/bin/perl
# Author	: KroKite
# URI		: http://krokite.com || http://board.blackbuntu.com (Pentesting Distro by c1ph3r {Big Bro})
# Description	: You can Download any Site Page in Text Format with this Script.
# Usage		: perl %prog <site_name> {%prog is the file name that you will save this script}

print "Content-type: text/html\n\n";

use strict;
use warnings;

use LWP::Simple;
use HTML::TreeBuilder;
use HTML::FormatText;

main(@ARGV);

sub main{
	print "[+] Please report any bug on http://krokite.com Contact page\n";
	print "[+] Enter Site URL for processing in text\n";
	my $site = <stdin>;
	chomp($site);

	my $url = get($site);

	my $format = HTML::FormatText->new;
	my $treepattern = HTML::TreeBuilder->new;
	$treepattern->parse($url);

	my $getPage = $format->format($treepattern);
	
	# If you also Want to View Page on Run time than Just Un-Comment below line.
	# print $getPage;

	# if you do not want to Download the file than Comment below
	my $safeChar = "a-zA-Z0-9_-";
	$site =~ s/http:\/\/www\.//g;
	$site =~ s/\./-/g;
	$site =~ s/[^$safeChar]//g;
	open(FH, ">$site.txt");
	print FH $getPage;
	close(FH);
}
