
$fn = 100;

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

module baseCube(){
    difference(){
        // create nameplate
        color("RED")roundedSoftSquare(height = height, width = width, length = length, r1=4, r2=0.5);
        translate([ 0, -10, 3]) roundedSoftSquare(height = height, width = width, length = length/2 + 6, r1=0, r2=0.5);
            
        translate([ 0, -10, 1.5]) linear_extrude(height=3) circle(13.0);
        #translate([-10,22,-3.4]) cylinder(5,3.3,3.25,$fn=50);
        #translate([10,22,-3.4]) cylinder(5,3.3,3.25,$fn=50);
    }
    
}
baseCube();
textStr = "Hello!";
textDepth = 2;
// NOTE: You need to change this to a different font
textFont = "Comic Sans MS:style=Bold";

//color("BLUE") translate([-width/2 + 5, 13, height + 1]) linear_extrude(file = "23b_logo_multi_color_0.dxf",  height = textDepth, center = true);
//color("BLUE") translate([-width/2 + 5, 13, height + 1]) linear_extrude(file = "ivu_logo.dxf",  height = textDepth, center = true);
//color("YELLOW") translate([-width/2 + 5, 13, height + 1]) linear_extrude(file = "23b_logo_multi_color_1.dxf",  height = textDepth, center = true);
//color("WHITE") translate([-width/2 + 5, 13, height]) linear_extrude(file = "23b_logo_multi_color_2.dxf",  height = textDepth, center = true);
color("WHITE") translate([-width/2 + 1, 0, height + 0.25]) linear_extrude(file = "ivu_logo.dxf",  height = textDepth, center = true);


color("WHITE") translate([ 0, length/3 + 4, height - 0.6]) linear_extrude(height=textDepth)
            text(textStr, size=5, font=textFont,
                 halign="center", valign="center");

color("WHITE") translate([ 0, length/3 - 5, height - 0.6]) linear_extrude(height=textDepth)
            text("My handle is", size=4, font=textFont,
                 halign="center", valign="center");



