#!/usr/bin/perl

use strict;
use warnings;
use XML::Simple;
use LWP::UserAgent;
use Data::Dumper;

main(@ARGV);

sub main{
print '
                                                    
 ___   ___      ______        ______       ___   ___      ________      _________   ______      
/___/\/__/\    /_____/\      /_____/\     /___/\/__/\    /_______/\    /________/\ /_____/\     
\::.\ \\\\ \ \   \:::_ \ \     \:::_ \ \    \::.\ \\\\ \ \   \__.::._\/    \__.::.__\/ \::::_\/_    
 \:: \/_) \ \   \:(_) ) )_    \:\ \ \ \    \:: \/_) \ \     \::\ \        \::\ \    \:\/___/\   
  \:. __  ( (    \: __ `\ \    \:\ \ \ \    \:. __  ( (     _\::\ \__      \::\ \    \::___\/_  
   \: \ )  \ \    \ \ `\ \ \    \:\_\ \ \    \: \ )  \ \   /__\::\__/\      \::\ \    \:\____/\ 
    \__\/\__\/     \_\/ \_\/     \_____\/     \__\/\__\/   \________\/       \__\/     \_____\/

';
 print "[+] Author : KroKite\n";
 print "[+] Greets to : c1ph3r, Nop MayaSeven, Xcode, windows98SE, Nocdem, fb1h2s\n";
 print "[+] URI: http://krokite.com\n";
 print "[+] For Security Researcher People, We highly Recommend Visiting http://board.blackbuntu.com\n";
 print "[+] Enter Domain Name or Ip-Address :- \n";
 print ">>> ";
 my $site=<STDIN>;
 chomp($site);
 my $ua = LWP::UserAgent->new(agent => 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.19 (KHTML, like Gecko) Ubuntu/10.10 Chromium/18.0.1025.151 Chrome/18.0.1025.151 Safari/535.19');
 my $xmlData = XML::Simple->new;
 my $fetchInfo = $ua->get('http://data.alexa.com/data?cli=10&dat=s&url='.$site);
 my $getResult = $fetchInfo->content;
 my $fdata = XMLin($getResult);
 # IF you want to Log all XML Sample Data, UnComment below line :)
 #print Dumper($fdata);
 my $isSiteAvailable = $fetchInfo->content;
 if ($isSiteAvailable =~ /POPULARITY/g){
  print "Currently Your Search Website Ranks at ".$fdata->{SD}->[1]->{POPULARITY}->{TEXT}."\n";
  print "Also, This website has Reached Rank till ".$fdata->{SD}->[1]->{REACH}->{RANK}."\n";
 }else{
   print "Couldnot Find Your Site @ Alexa :(\n";
 }
}
