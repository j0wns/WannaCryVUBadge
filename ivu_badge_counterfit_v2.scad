
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
        color("WHITE")roundedSoftSquare(height = height, width = width, length = length, r1=4, r2=0.5);
        translate([ 0, -10, 3]) roundedSoftSquare(height = height, width = width, length = length/2 + 6, r1=0, r2=0.5);



        magDmm = 5.0;
        nozzleD = 0.6;


        // 0.6 0.5 projected 5.26
        nozzleRatio = 0.5;
        nozzleMargin = nozzleRatio * nozzleD;
        pressTaper = 0.02;

        radOuter = ( magDmm + nozzleMargin ) / 2.0 + pressTaper;
        radInner = ( magDmm + nozzleMargin ) / 2.0 - pressTaper;
            
        translate([ 0, -10, 1.5]) linear_extrude(height=3) circle(13.0);
        // #translate([-10,22,-3.4]) cylinder(5,3.3,3.25,$fn=50);
        // #translate([10,22,-3.4]) cylinder(5,3.3,3.25,$fn=50);
        // translate([-10,22,-3.4]) cylinder(5,3.3,3.25,$fn=50);
        // translate([10,22,-3.4]) cylinder(5,3.3,3.25,$fn=50);
        // #translate([-10,22,-3.4]) cylinder(5,2.53,2.48,$fn=50);
        // #translate([ 10,22,-3.4]) cylinder(5,2.53,2.48,$fn=50);
        #translate([-10,22,-3.4]) cylinder(5,radOuter,radInner,$fn=50);
        #translate([ 10,22,-3.4]) cylinder(5,radOuter,radInner,$fn=50);
    }
    
}


//INIT Raised elements
defaultDepth = height;
logoDepth = defaultDepth;
lineOneDepth = defaultDepth;
lineTwoDepth = defaultDepth;
defaultFontSize = 4;
lineOneFontSize = defaultFontSize;
lineTwoFontSize = defaultFontSize;
defaultFont = "Comic Sans MS:style=Bold";
lineOneFont = defaultFont;
lineTwoFont = defaultFont;
lineOneText = "Greetings and salutations";
lineTwoText = "You can call me";
// textFont = "Wingdings:style=Bold";


//CUSTOMIZE
// NOTE: You need to change these Defaults
logoDepth = 1.8;
lineOneDepth = 1.8;
lineTwoDepth = 1.8;
// lineOneFont = "S.8ource Code Pro:style=Bold";
// lineTwoFont = "Source Code Pro:style=Bold";
// lineOneFontSize = 6;
// lineTwoFontSize = 5;
lineOneFont = "Source Code Pro:style=Semibold";
lineTwoFont = "Source Code Pro:style=Semibold";
lineOneFontSize = 7;
lineTwoFontSize = 7;
lineOneText = "Hello!";
lineTwoText = "My handle is";


// textFont = "Source Code Pro:style=Bold";
// textStr = "EHLO";
// testStr2 = "AUTH LOGIN";
// textFont = "Ac437 IBM BIOS";textDepth = 2;
// textDepth = 3;

// difference () {
baseCube();


//color("BLUE") translate([-width/2 + 5, 13, height + 1]) linear_extrude(file = "23b_logo_multi_color_0.dxf",  height = textDepth, center = true);
//color("BLUE") translate([-width/2 + 5, 13, height + 1]) linear_extrude(file = "ivu_logo.dxf",  height = textDepth, center = true);
//color("YELLOW") translate([-width/2 + 5, 13, height + 1]) linear_extrude(file = "23b_logo_multi_color_1.dxf",  height = textDepth, center = true);
//color("WHITE") translate([-width/2 + 5, 13, height]) linear_extrude(file = "23b_logo_multi_color_2.dxf",  height = textDepth, center = true);
// color("RED") translate([-width/2 + 1, 0, height + 0.25]) linear_extrude(file = "ivu_logo.dxf",  height = textDepth, center = true);
color("RED") translate([-width/2 + 1, 0, height + 0.5 ]) linear_extrude(file = "ivu_logo.dxf",  height = logoDepth, center = false);


// color("WHITE") translate([ 0, length/3 + 4, height - 0.6]) linear_extrude(height=textDepth)
            // text(textStr, size=5, font=textFont,
            //      halign="center", valign="center");
color("RED") translate([ -width/4.5, length/3 + 4, height + 0.5]) linear_extrude(height=lineOneDepth)
            text(lineOneText, size=lineOneFontSize, font=lineOneFont,
                 halign="left", valign="center");

color("RED") translate([ -width/4.5, length/3 - 5, height + 0.5]) linear_extrude(height=lineTwoDepth)
            // text("My handle is", size=4, font=textFont,
            //      halign="center", valign="center");
            text(lineTwoText, size=lineTwoFontSize, font=lineTwoFont,
                 halign="left", valign="center");

// }

