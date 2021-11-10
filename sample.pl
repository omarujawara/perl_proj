 use strict;
 use feature "say";
 use warnings;

my @numbers = qw /one two three four five six seven eight nine/;
open(FILE_WRITE,">numbers.txt");
open(FILE_READ,"<sample.txt");
 while(<FILE_READ>) {
     my $line = $.;
     $line = $line - 1;
     s/$_/$numbers[$line]/;
     say FILE_WRITE $_;
 }
 close(FILE_READ);
 close(FILE_WRITE)


# my %numbers = (
#     '0' => 'zero', '1' => 'one', '2' => 'two', '3' => 'three', '4' => 'four',
#     '5' => 'five', '6' => 'six', '7' => 'seven', '8' => 'eight', '9' => 'nine'
# );
# # open(FILE_WRITE,">>numbers.txt");
# open(FILE_READ,"<sample.txt");
#  while(<FILE_READ>) {
#     #  s/$_/$numbers{$_}/;
#      say $_;

#     # print $numbers{"".$_.""};
#  }
#  close(FILE_READ);
# #  close(FILE_WRITE)
