#!/usr/bin/perl -w 
use strict;

unless(@ARGV == 2 ){
   print "perl $0 gene.list.for.selection dataset.which.want.to.selete.genes\n";
   exit(1);
}

my(%hash);

open IN,"<$ARGV[1]" || die "$!";
while(<IN>){
   chomp;
   if($_ =~ /gene_id/ ){print "$_\n";}
   my @temp = split(/\t/,$_);
   $hash{$temp[0]}= $_;
}
close IN;

open IP,"$ARGV[0]" || die "$!";
while(<IP>){
   chomp;
   if(defined $hash{$_}){print $hash{$_}."\n";}
}
close IP;
