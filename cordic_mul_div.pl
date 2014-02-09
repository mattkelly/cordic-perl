#/usr/bin/env perl
use strict;
use warnings;

my $B = 24;
my $z = 0.0;
my $mul_or_div = $ARGV[0];
my $x = $ARGV[1];
my $y = $ARGV[2];
die "USAGE: perl cordic_mul_div [mul|div] x y\n" unless $mul_or_div =~ /^(mul|div)/;
die "USAGE: perl cordic_mul_div [mul|div] x y\n" unless $x;
die "USAGE: perl cordic_mul_div [mul|div] x y\n" unless $y;

printf "\nx = %1.8f\n", $x, $x;
printf "y = %1.8f\n\n", $y, $y;

if( $mul_or_div =~ /^mul/ ) {

    print "Calculating z = x * y\n\n";

    for( my $i = 1; $i <= $B; $i++ ) {
        if( $x > 0 ) {
            $x = $x - 2**(-$i);
            $z = $z + $y*2**(-$i);
        } else {
            $x = $x + 2**(-$i);
            $z = $z - $y*2**(-$i);
        }
        printf "\t%1.16f\n", $z;
    }

} elsif( $mul_or_div =~ /^div/) {

    print "Calculating z = x / y\n\n";

    for( my $i = 1; $i <= $B; $i++ ) {
       if( $x > 0 ) {

           if( $y > 0 ) {
               $x = $x - $y*2**(-$i);
               $z = $z + 2**(-$i);;
            } else {
               $x = $x + $y*2**(-$i);
               $z = $z - 2**(-$i);;
            }
                
       } else {
           if( $y > 0 ) {
               $x = $x + $y*2**(-$i);
               $z = $z - 2**(-$i);
            } else {
               $x = $x - $y*2**(-$i);
               $z = $z + 2**(-$i);
            }
       }
       printf "\t%1.16f\n", $z;
    } 

}

printf "\nFinal result: z = %1.16f\n\n", $z;
