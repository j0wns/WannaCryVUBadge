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

// translate([-10,22,-3.4]) cylinder(5,2.53,2.48,$fn=50); // 0.6 too narrow

magDmm = 5.0;
nozzleD = 0.6;

nozzleRatio = 0.5;
nozzleMargin = nozzleRatio * nozzleD;
pressTaper = 0.02;

radOuter = ( magDmm + nozzleMargin ) / 2.0 + pressTaper;
radInner = ( magDmm + nozzleMargin ) / 2.0 - pressTaper;

difference(){
    roundedSoftSquare(2,35,10,2,0.5);
    // #translate([-10,0,0.3]) cylinder(5,2.83,2.78,$fn=50);
    // #translate([ 10,0,0.3]) cylinder(5,2.83,2.78,$fn=50);
    #translate([-10,0,0.3]) cylinder(5,radOuter,radInner,$fn=50);
    #translate([ 10,0,0.3]) cylinder(5,radOuter,radInner,$fn=50);
}