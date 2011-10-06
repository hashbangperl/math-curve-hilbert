#!/usr/bin/perl

unshift(@INC,'.');

use Math::Curve::Hilbert;
$levels = 2;
$limit = 2 ** $levels;

@dirs = ('up','right','down','left');

foreach $dir (@dirs) {
  for($cw=0;$cw<=1;$cw++) {
    my $hilbert = Math::Curve::Hilbert->new(
        direction=>$dir, max=>$levels, clockwise=>$cw);

    print "$dir $cw\n";
    for($y=1;$y<=$limit;$y++) {
      for($x=1;$x<=$limit;$x++) {
        $p = $hilbert->PointFromCoordinates($x,$y);
        printf("%3d ",$p);
      }
      print "\n";
    }
    print "\n";

#    for($h=0;$h<$limit**2;$h++) {
#      ($x,$y) = $hilbert->CoordinatesFromPoint($h);
#      print "$h: $x,$y\n";
#    }
  
    for($y=1;$y<=$limit;$y++) {
      for($x=1;$x<=$limit;$x++) {
        $p = $hilbert->PointFromCoordinates($x,$y);
        ($tx,$ty) = $hilbert->CoordinatesFromPoint($p);
        if($tx!=$x && $ty!=$y) {
          print "ERROR:\n";
          print "$x,$y -> $p\n";
          print "$p -> $tx,$ty\n";
        }
      }
    }
    for($h=0;$h<$limit**2;$h++) {
      ($x,$y) = $hilbert->CoordinatesFromPoint($h);
      $p = $hilbert->PointFromCoordinates($x,$y);
      if($p != $h) {
        print "ERROR:\n";
        print "$h -> $x,$y\n";
        print "$x,$y -> $p\n";
      }
    }
    print "\n";
  }
}
