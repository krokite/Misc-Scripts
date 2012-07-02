#!/usr/bin/perl

use strict;
use warnings;
use LWP::UserAgent;

main();

sub main{
	print '
	$$ \ $$\   $$$$$$$\  $$$$$$\   $$\   $$\ $$$$$$\ $$$$$$$$\ $$$$$$$$\
	$$ | $$ |  $$ __$$ \ $$ __$$\  $$ | $$ | \_$$ _| \__$$ __| $$ _____|
	$$ |$$ /   $$ | $$ | $$ / $$ | $$ |$$ /    $$ |     $$ |   $$ |
	$$$$$ /    $$$$$$$ | $$ | $$ | $$$$$ /     $$ |     $$ |   $$$$$\
	$$$ $$ \   $$ __$$ | $$ | $$ | $$ $$|      $$ |     $$ |   $$ __|
	$$ |\$$\   $$ | $$ | $$ | $$ | $$ |\$$\    $$ |     $$ |   $$ |
	$$ | \$$\  $$ | $$ | $$$$$$ |  $$ | \$$\ $$$$$$\    $$ |   $$$$$$$$\
	\__|  \__| \__| \__| \______/  \__| \__| \______|   \__|   \________|
	';
	
	echo("\n[+] Please Report any Bug to http://krokite.com");
	echo("[+] Greets to: c1ph3r(Krit Kadnok), Nocdem, MayaSeven, Xcode, webDEVIl, fb1h2s, windows98se");
	echo("[+] For Security Releated Discussions, Do Visit us at http://board.blackbuntu.com or http://worldofhacker.com");
	echo("[+] This Application helps you to Know Or Perform WHOIS on any domain or IP Address, You Specify Below");
	&process;
}

sub process{
	echo("[+] Please Specify IP Address or Domain Below");
	print ">>> ";
	my $target = <stdin>;
	chomp($target);
	if($target =~ /([\w\d\-]+)?\.([\w\d])/) {
		my $ua = LWP::UserAgent->new(agent => 'KroKite v1.0 Whois Checker');
		my $getIs = $ua->post("http://scanmyip.com/ip.php?domain=$target");
		my $Whois = $getIs->content;
		echo("[+] Do You want to See the OutPut now or Do You want to Save the Whois in Your Current Directory with $target.txt name");
		echo("[+] Press Yes for See OutPut Right Now or No to Save the Output in Above Specified file");
		print ">>> ";
		my $confirm = <stdin>;
		chomp($confirm);
		if($confirm =~ /y/i){
			print $Whois;
		}elsif($confirm =~ /N/i){
			my $file = "$target.txt";
			open(FH, ">$file");
			print FH $Whois;
			close(FH);
			echo("[+] Do You want me to Open File for You");
			echo("[+] Press 'Y' for Yes, 'N' for No");
			print ">>> ";
			my $ans = <stdin>;
			chomp($ans);
			if($ans =~ /y/i) {
				`gedit $target.txt &`;
			}else{
				echo("[+] Whois Done :)");
				exit;
			}
			exit;
		}else{
			echo("[+] Oh Boy, You Pressed Something that I dont Understand");
			echo("[+] You were supposed to Press 'Y' or 'N'");
			echo("[+] I am Quitting :(");
			exit;
		}
	}elsif($target =~ /([(\d)+]?\.){3}/) {
		my $ua = LWP::UserAgent->new(agent => 'KroKite v1.0 Whois Checker');
		my $getIs = $ua->post("http://scanmyip.com/ip.php?domain=$target");
		my $Whois = $getIs->content;
		echo("[+] Do You want to See the OutPut now or Do You want to Save the Whois in Your Current Directory with $target.txt name");
		echo("[+] Press Yes for See OutPut Right Now or No to Save the Output in Above Specified file");
		print ">>> ";
		my $confirm = <stdin>;
		chomp($confirm);
		if($confirm =~ /y/i){
			print $Whois;
		}elsif($confirm =~ /N/i){
			my $file = "$target.txt";
			open(FH, ">$file");
			print FH $Whois;
			close(FH);
			echo("[+] Do You want me to Open File for You");
			echo("[+] Press 'Y' for Yes, 'N' for No");
			print ">>> ";
			my $ans = <stdin>;
			chomp($ans);
			if($ans =~ /y/i) {
				`gedit $target.txt &`;
			}else{
				echo("[+] Whois Done :)");
				exit;
			}
			exit;
		}else{
			echo("[+] Oh Boy, You Pressed Something that I dont Understand");
			echo("[+] You were supposed to Press 'Y' or 'N'");
			echo("[+] I am Quitting :(");
			exit;
		}
	}else{
		echo("[+] Oh Boy, You Pressed Something that I dont Understand");
		echo("[+] You were supposed to Write Domain Name or IP Address");
		echo("[+] I am Quitting for Now :(");
		exit;
	}
}

sub echo{
	my $message = shift || return;
	print "$message\n";
}
