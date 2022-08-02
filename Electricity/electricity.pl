 use utf8;
 use strict;
 use feature "say";
 use warnings;

my %words_freq = ();
my @records; 
open(FILE_WRITE,">./Electricity/electricity_output.txt");
open(FILE_READ,"<./Electricity/electricity.txt") or die $!; # read from electricity file
 while(<FILE_READ>) {
    $_ =~ s/(\.+|\,+|\[|\]|\"|\(|\)|\:|\-|[0-9])//g; #should I reomve apostrophe
    chomp;
    foreach my $word (split /[\s+]/ , $_) {
        $word =~ tr/A-Z/a-z/;
        push @records, $word;
        ++@words_freq{$word};
    }
 }
close(FILE_READ);

foreach my $word (sort { $a cmp $b} @records) {
    if ($word eq "") { next; }
    else { say FILE_WRITE $word; }
}
close(FILE_WRITE);

# while (( my $key, my $value) = each(%words_freq))
# {
      
#     # Printing(key, value) pair
#     print("$key => $value\n");
# }
