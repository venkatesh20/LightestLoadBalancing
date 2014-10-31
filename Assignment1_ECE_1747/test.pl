#!/usr/bin/perl


use Data::Dumper;

my $file=$ARGV[0];

my @data=();

my ($thread,$player,$action,$time)=();
my ($nthread,$nplayer,$naction,$ntime, $atime)=();

my %hash=();
my %newhash=();
my %ahash=();


open(FILE,$file) or die("[ERROR]: Cannot open file $file for reading\n $!");
 while (my $line = <FILE>) {

  if ($line !~ m/^\s+$/) {
  chomp($line);
  ($thread,$player,$action,$time)=split(/\,/,$line);
  push(@{$hash{$thread}{$player}{$action}}, $time);
 }
} 


close(FILE);


foreach my $key (sort keys %hash) {
   $ntime=0;
   $nthread=$key;

  foreach my $key1(keys %{$hash{$key}}) {
    $nplayer = $key1;

    foreach my $key2(keys %{$hash{$key}{$key1}}) {
      $atime=0;
      $naction = $key2;

      foreach my $value(@{$hash{$key}{$key1}{$key2}}) {
         $ntime+=$value;
         $atime+=$value;
    }
     push(@{$ahash{$naction}},$atime);
     push(@{$nhash{$nthread}{$nplayer}{$naction}},$ntime);
   }
  }
}

open(FILE1,">formatted_requests.csv") or die("[ERROR]: Cannot open file formatted_requests.csv for writing \n $!");
foreach my $key (sort keys %ahash) {
  foreach my $value(@{$ahash{$key}}) {
     print FILE1 "$key,$value\n";
  }
}
close(FILE1);

open(FILE2,">formatted_updates.csv") or die("[ERROR]: Cannot open file formatted_updates.csv for writing \n $!");
foreach my $key (sort keys %nhash) {
  foreach my $key1(keys %{$nhash{$key}}) {
   foreach my $key2(keys %{$nhash{$key}{$key1}}) {
      foreach my $value(@{$nhash{$key}{$key1}{$key2}}) {
         print FILE2 "$key,$key1,$key2,$value\n";
      }
    }
   }
 }
close(FILE2);



