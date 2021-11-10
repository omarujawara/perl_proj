 use strict;
 use feature "say";
 use warnings;

open(FILE_WRITE,">numbers.txt");
open(FILE_READ,"<sample.txt");
 while(<FILE_READ>) {
   
    my @arr = split //, $_; # split into array of characters
                            # and iterate over them

    for (@arr) {
        if($_ eq "0") { print FILE_WRITE "0";}
        elsif($_ eq "1") { print FILE_WRITE "1";}
        elsif($_ eq "2") { print FILE_WRITE "2";}
        elsif($_ eq "3") { print FILE_WRITE "3";}
        elsif($_ eq "4") { print FILE_WRITE "4";}
        elsif($_ eq "5") { print FILE_WRITE "5";}
        elsif($_ eq "6") { print FILE_WRITE "6";}
        elsif($_ eq "7") { print FILE_WRITE "7";}
        elsif($_ eq "8") { print FILE_WRITE "8";}
        elsif($_ eq "9") { print FILE_WRITE "9";}
        else { print FILE_WRITE $_;}
    }

 }
 close(FILE_READ);
 close(FILE_WRITE)
