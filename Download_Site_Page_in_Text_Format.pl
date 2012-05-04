#!/usr/bin/perl
# Author	: KroKite
# URI		: http://krokite.com
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
	print "[+] Please report any bug on http://krokite.com Contact page";
	print "[+] Enter Site URL for processing in text";
	my $site = <stdin>;
	chomp($site);

	my $url = get($site);

	my $format = HTML::FormatText->new;
	my $treepattern = HTML::TreeBuilder->new;
	$treepattern->parse($url);

	my $getPage = $format->format($treepattern);
	
	# If you Only Want to View Page and Not Downloading than Just Remove Comment @ below line
	# print "$getPage";

	# if you do not want to Download the file than Comment below
	my $safeChar = "a-zA-Z0-9_-";
	$site =~ s/http:\/\/www\.//g;
	$site =~ s/\./-/g;
	$site =~ s/[^$safeChar]//g;
	open(FH, ">$site.txt");
	print FH $getPage;
	close(FH);
}
