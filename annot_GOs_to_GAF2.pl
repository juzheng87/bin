#!/usr/bin/perl
use strict;

my $usage = <<USAGE;
Usage:
    perl $0 annot_GOs_file_from_blast2go > go.gaf2

USAGE
if (@ARGV==0){die $usage}

my $date = `date +%Y%m%d`;
chomp($date);
print "!Generated by Blast2GO\n!Date: $date\n!gaf-version: 2.0\n";
open IN, $ARGV[0] or die $!;
while (<IN>) {
	chomp;
	@_ = split /\t/;
	print "B2G\t$_[0]\t$_[0]\t\t$_[2]\tGO_REF:nd\tND\t\t$_[4]\t$_[1]\tNA\tNA\taxon:0\t$date\tB2G\t\t\n";
}
close IN;
