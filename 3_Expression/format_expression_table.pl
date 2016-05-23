#!/usr/bin/perl -w 
use strict;

unless(@ARGV==2){
  print "perl $0 sample.list(list format: sample_name expression_file) outdir\n";
  exit(1);
}

my(@samples,%exp);

open IN,"<$ARGV[0]" || die "$!";
open OUT,">$ARGV[1]/All.gene.expression.xls" || die "$!";
while(<IN>){
   chomp;
   my @ary = split(/\t/,$_);
   die "The list format should be: sample_name expression_file sh_info(optional).\n"
                if (!defined $ary[1]);
   my $sample = $ary[0];
       print OUT "\t$sample";
   push @samples,$sample;
   open my $fh_rpkm,"<",$ary[1] or die $!;<$fh_rpkm>;
   while(<$fh_rpkm>) {
      chomp;
      my @a = split /\s+/;
      $exp{$a[0]}{$sample} = $a[4];
   }
   close $fh_rpkm;
}
close IN;
print OUT "\n";

foreach my $gene (sort keys %exp){
  print OUT "$gene";
  foreach my $sample(@samples){
     if(!defined $exp{$gene}{$sample}){
        print OUT "\t0.0001";
     }else{print OUT "\t$exp{$gene}{$sample}";}
  }print OUT "\n"; 
}
close OUT;
