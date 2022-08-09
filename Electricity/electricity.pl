 use utf8;
 use strict;
 use feature "say";
 use warnings;

my %words_freq; # hash data to store frequency words' count
my @records;  # store all words
my @freq_high_to_low; #store keys for sorted frequency from high to low


# 1. Read from electricity file.
# 2. Count frequency as inputs are read.
open(FILE_READ,"<./Electricity/electricity.txt") or die $!; 
 while(<FILE_READ>) {
    $_ =~ s/(\.+|\,+|\[|\]|\"|\(|\)|\:|\-|\?|[0-9])//g; #should I reomve apostrophe fron words?
    chomp;
    foreach my $word (split /[\s+]/ , $_) {
        $word =~ tr/A-Z/a-z/; #convert all words to lower
        next if $word eq ""; #do not append any empty strings.
        push @records, $word;
        ++$words_freq{$word}; #frequency count
    }
 }
close(FILE_READ);


# Write to output file/
# 1. alphabetically (ignoring capitalization)
open(FILE_WRITE,">./Electricity/electricity_output.txt");
foreach my $word (sort { $a cmp $b} @records) {
    say FILE_WRITE $word."\t\t";
}

open (FILE_READ, "<./Electricity/electricity_output.txt");

close(FILE_READ);

# 2. alphabetically with upper case words just in front of lower case words with the same initial characters
# foreach my $word (sort { $a cmp $b} @records) {
#     if ($word eq "") { next; } else { say FILE_WRITE $word; }
# }

# 3. by frequency, from high to low (any order for equal frequency)
foreach my $key ( sort { $words_freq{$b} <=> $words_freq{$a} } keys %words_freq ) {
    push @freq_high_to_low, $key
    
}

# 4. by frequency, with alphabetical order for words with the same frequency
# open(FILE_WRITE,">./Electricity/electricity_output.txt");
# foreach my $word (sort { $a cmp $b} @records) {
#     if ($word eq "") { next; } else { say FILE_WRITE $word; }
# }
close(FILE_WRITE);




#display word count;
my $size = scalar @records;
say "Word count: $size";

# foreach (@freq_high_to_low) {
#     say $_;
# }