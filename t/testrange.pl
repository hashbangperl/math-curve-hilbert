#!/usr/bin/perl -w
use strict;
 
use Data::Dumper;
 
use Math::Curve::Hilbert;
 
# get array of coordinates to draw 8x8 curve in 80x80 pixels
my ($startx,$starty) = (1,1);
my $hilbert = Math::Curve::Hilbert->new( direction=>'down', max=>3, level=>0, X=>\$startx, Y=>\$starty, clockwise=>0, step=>1);

# get points
print "points\n";
print "1,1 :", $hilbert->PointFromCoordinates(1,1), "\n";
print "1,8 :", $hilbert->PointFromCoordinates(1,8), "\n";
print "8,1 :", $hilbert->PointFromCoordinates(8,1), "\n";
print "8,8 :", $hilbert->PointFromCoordinates(8,8), "\n";

#exit;

# get range(s) from box
my @ranges = $hilbert->RangeFromCoordinates(2,2,4,4);

print "\nranges : \n";
foreach (@ranges) {
    print "$_\n";
}

