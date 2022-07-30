 use utf8;
 use strict;
 use feature "say";
 use warnings;

my @records; 
open(FILE_WRITE,">sortAlphabeticallyIngoreCase.txt");
open(FILE_READ,"<electricity.txt"); # read from electricity file
 while(<FILE_READ>) {
    $_ =~ s/(\.+|\,+|\[|\]|\"|\(|\)|\:|\-|[0-9])//g;
    chomp;
    foreach my $arr (split /[\s+]/ , $_) {
        push @records, $arr ;
    }
 }
close(FILE_READ);

foreach my $word (sort { $a cmp $b} @records) {
    if ($word eq "") { next; }
    else { say FILE_WRITE $word; }
}
close(FILE_WRITE)