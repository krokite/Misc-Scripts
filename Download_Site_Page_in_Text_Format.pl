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
	$site = <stdin>;
	chomp($site);

	$url = get($site);

	$format = HTML::FormatText->new;
	$treepattern = HTML::TreeBuilder->new;
	$treepattern->parse($url);

	$getPage = $format->format($treepattern);
	
	# If you Only Want to View Page and Not Downloading than Just Remove Comment @ below line
	# print "$getPage";

	# if you do not want to Download the file than Comment below
	$safeChar = "a-zA-Z0-9_-";
	$site =~ s/http:\/\/www\.//g;
	$site =~ s/\./-/g;
	$site =~ s/[^$safeChar]//g;
	open(FH, ">$site.txt");
	print FH "$getPage";
	close(FH);
}
