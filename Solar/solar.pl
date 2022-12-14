use utf8;
use strict;
use feature "say";
use warnings;
 
 # declared arrays to be used
 my @no_discoverer;
 my @omit_field2; 
 my @negative_orbital_period; 
 my @discovered_by_voyager2;
 my @convert_orbit_period_to_seconds;
 open(FH,"<./solar.txt") or die $!; # read from solar file
 while(<FH>) {
    # the following statements  in the whileloop will push the output to
    # the corresponding array;
    
    push @no_discoverer, join " ", &no_discoverer($_);
    push @omit_field2, join " ", &omit_field2($_);
    push @negative_orbital_period, join " ", &negative_orbital_period($_);
    push @discovered_by_voyager2, join " ", &discovered_by_voyager2($_);
    push @convert_orbit_period_to_seconds, join " ", &convert_orbit_period_to_seconds($_);

 }
 close(FH);

# pribt the results ...
print "\n";
say "*** Records that do not list  a discoverer in the eighth field ****"; print "\n";
say @no_discoverer;print "\n";
say "****************** Recoords ommiting second field ****************"; print "\n";
say @omit_field2;print "\n";
say "************* Records with negative orbital periods **************"; print "\n";
say @negative_orbital_period;print "\n";
say "*************** Objects dicovered by Voyager 2 *******************"; print "\n";
say @discovered_by_voyager2;print "\n";
say "************* Orbital periods from days to seconds****************"; print "\n";
say @convert_orbit_period_to_seconds;
say "******************************************************************"; print "\n";


 #helper functions
 sub no_discoverer { # iterate over and list the records with no discoverer
     my $target_index = 7;
     my ($record) = @_;
     my @temp_record = split(/ /,$record); #split by whitespace and store in array
     if ($temp_record[$target_index]=~m/-/) {
        return @temp_record;
     }
 }
 sub omit_field2 { # Ommit the second field from each record and list them
     my $target_index = 1;
     my ($record) = @_;
     my @temp_record = split(/ /,$record); #split by whitespace and store in array
     splice (@temp_record,1,1);
     return @temp_record;
 }
sub negative_orbital_period { # Search through and list the records with negative orbit period
    my $target_index = 4;
    my ($record) = @_;
    my @temp_record = split(/ /,$record); #split by whitespace and store in array
    if($temp_record[$target_index]=~/^\-[\d]/) {
        return @temp_record;
    }
}
sub discovered_by_voyager2 { #Search through and list the recordords with discoverers as Voyage2
    my $target_index = 7;
    my ($record) = @_;
    my @temp_record = split(/ /,$record); #split by whitespace and store in array
    if($temp_record[$target_index]=~m/Voyager2/) {
        return @temp_record;
    }
}
sub convert_orbit_period_to_seconds { #A subroutine to convert orbit period days into seconds
    my $target_index = 4;
    my ($record) = @_;
    my @temp_record = split(/ /,$record);
    if($temp_record[$target_index]!~m/(\?|\-)/) { # if orbit periods not ignore ? or -
        $temp_record[$target_index] =~ s/^\s+|\s+$//g; #remove any trailing and/or leading whitespaces to be able to work with it numerically
        $temp_record[$target_index] *= 86400; # formula to convert days into seconds
    }
    return @temp_record;
}

