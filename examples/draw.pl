#!/usr/bin/perl -w
use strict;

use Data::Dumper;

use Math::Curve::Hilbert;

# get array of coordinates to draw 8x8 curve in 80x80 pixels
my $hilbert = Math::Curve::Hilbert->new( direction=>'right', max=>3, clockwise=>1, step=>20);

# fixme
 my $point = $hilbert->PointFromCoordinates(80,140);

print $hilbert->PointFromCoordinates(40,40);

print $hilbert->PointFromCoordinates(120,40);

print $hilbert->PointFromCoordinates(40,120);

print $hilbert->PointFromCoordinates(120,120);


# warn Dumper(curve=>$hilbert->{curve});
# warn Dumper(curve=>$hilbert->{coords});

use GD;
# create a new image
my $im = new GD::Image(300,300);

# allocate some colors
my $white = $im->colorAllocate(255,255,255);
my $black = $im->colorAllocate(0,0,0);
my $red = $im->colorAllocate(255,0,0);
my $blue = $im->colorAllocate(0,0,255);

my $count = 0;
my ($x1,$y1) = $hilbert->CoordinatesFromPoint($count++);
while ( ($hilbert->CoordinatesFromPoint($count))[0] ) {
    my ($x2,$y2) = $hilbert->CoordinatesFromPoint($count++);
    $im->line($x1,$y1,$x2,$y2,$black);
    ($x1,$y1) = ($x2,$y2);
}

$count = 0;
while ( ($hilbert->CoordinatesFromPoint($count))[0] ) {
    my ($x,$y) = $hilbert->CoordinatesFromPoint($count);
    warn "x:$x / y:$y / count : $count \n";
    $im->string(gdSmallFont,$x,$y,"$count",$blue);
    $count++;
}

$im->string(gdSmallFont,25,25,"25,25",$black);
$im->string(gdSmallFont,25,250,"25,250",$black);
$im->string(gdSmallFont,250,25,"250,25",$black);
$im->string(gdSmallFont,250,250,"250,250",$black);

open (FILE,'>out3.png');
print FILE $im->png;
close FILE;
