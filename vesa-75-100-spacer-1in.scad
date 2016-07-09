$fn=90;
INCH=25.4; //mm
//render without top and bottom, 5-10% fill

M4=4;//4mm M4

bolthole=M4;
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

/*
module twoholebar(d100,holediameter,overshoot)
{
difference() {
cylinder(r=(holediameter+overshoot)/2);
}{
color("red")
translate([0,0,-0.05])scale([1,1,1.1])
cylinder(r=holediameter/2);
}
    
//translate([0,d100,0])
//cylinder(r=holediameter/2);
}

twoholebar(d100=100,holediameter=M4,overshoot=M4*2);

translate([25,25,0])
twoholebar(d100=75,holediameter=M4,overshoot=M4*2);
*/