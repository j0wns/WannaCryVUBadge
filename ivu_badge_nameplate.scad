
$fn = 40;

height = 5;
width = 100;
length = 65;

// create module for easy reuse

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

module namePlateCube(){
    
    // create nameplate
    translate([ 0, -10, 3]) color("WHITE") roundedSoftSquare(height = height - 3, width = width, length = length/2 + 6, r1=0, r2=0.5);
    
}

textStr = "JWNS";

textStr = "jwns";
textFont = "Source Code Pro:style=SemiBold";
fontSize=26;
// textStr = "SldOUw==";
// textFont = "Ac437 IBM BIOS";
// fontSize=10;

textDepth = 1.8;
// textFont = "Helvetica:style=Bold";


// difference () {

namePlateCube();

color("RED") translate([ 0,  - 10, height + 0.5]) linear_extrude(height=textDepth)
            text(textStr, fontSize, font=textFont,
                 halign="center", valign="center");

// }
