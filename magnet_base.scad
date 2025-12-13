module roundedSoftSquare(height, width, length, r1=4, r2=0.5) {
  $fn = 40;

  minkowski() {
    // 1) Base shape: extruded rounded rectangle in 2D
    linear_extrude(height=height) 
      offset(r=r1) square([width - 2*r1, length - 2*r1], center=true);

    // 2) Minkowski shape: sphere or cylinder
    sphere(r=r2);
  }
}

difference(){
    roundedSoftSquare(2,35,10,2,0.5);
    #translate([-10,0,0.3]) cylinder(5,3.3,3.3,$fn=50);
    #translate([10,0,0.3]) cylinder(5,3.3,3.3,$fn=50);
}