  use utf8;
  use strict;
 use feature "say";
 use warnings;

my %digit_alpha_correspond = (
        "0" => "zero", "1" => "one","2" => "two",
        "3" => "three","4" => "four","5" => "five",
        "6" => "six","7" => "seven","8" => "eight",
        "9" => "nine");


open(FILE_WRITE,">","./DigitToAlpha/sample_output.txt");
open(FILE_READ,"<","./DigitToAlpha/sample.txt");
 while(<FILE_READ>) {
   
    my @arr = split //, $_;
    for(my $i = 0; $i < scalar @arr; ++$i) {
        if ($arr[$i] =~ /[0-9]+/) {
            $arr[$i] = $digit_alpha_correspond{$arr[$i]};
        }
    }
    print FILE_WRITE join "", @arr;
 }
 close(FILE_READ);
 close(FILE_WRITE)

