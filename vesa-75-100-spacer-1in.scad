// 
// VESA spacer, suitable for 3-D printing.
// 
// Tested on Ultimaker Original.  
// 75mm and 100mm square patterns.
// Please feel free to submit other 
// variations, as desired.
// 


// 
// Copyright (c) 2016, Anthony Godshall
// 
// This work is licensed under the Creative Commons 
// Attribution-ShareAlike 4.0 International License. 
// To view a copy of this license, visit 
// 
//   http://creativecommons.org/licenses/by-sa/4.0/ 
// 
// or send a letter to Creative Commons, 
// PO Box 1866, Mountain View, CA 94042, USA.
// 

$fn=90; // curve smoothness

INCH=25.4; //mm
//render without top and bottom, 5-10% fill

M4HOLE=5; // Hole for M4

bolthole=M4HOLE;
padsize=bolthole*2;
insize=bolthole/2;
d100=100;
d75=75;

module spacer()
{
    cylinder(h = 1, r=padsize/3, center = true);
}

module hole()
{
      cylinder(h=2,r=bolthole/2,center=true);
}

scale([1,1,INCH])
difference() {
  hull(){
    translate([0,0,0])spacer();
    translate([d100,0,0])spacer();
    translate([d100,d100,0])spacer();
    translate([0,d100,0])spacer();
  }
  hole();
  translate([d100,0,0])hole();
  translate([d100,d100,0])hole();
  translate([0,d100,0])hole();
  translate([(d100-d75)/2,(d100-d75)/2,0]){
    hole();
    translate([d75,0,0])hole();
    translate([d75,d75,0])hole();
    translate([0,d75,0])hole();
  }
  translate([(d100-d75)/2,(d100-d75)/2,0]){
    hull(){
      translate([insize,insize,0])hole();
      translate([d75-insize,insize,0])hole();
      translate([d75-insize,d75-insize,0])hole();
      translate([insize,d75-insize,0])hole();
    }
  }
}

