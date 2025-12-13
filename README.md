# WannCryVU Badge

If you wanna make your own counterfeit IVU badge that is better than the original, you gotta think outside the shell. Welcome to CODING YOUR OWN BADGE. Check it out. Look around. Have fun. Make a PR! 

## Overview

This project provides OpenSCAD models and DXF graphics to create custom 3D-printed badges with magnetic mounting capabilities.

## Files

### OpenSCAD Models
- **`ivu_badge_counterfit_v2.scad`** - Main badge design with IVU logo and customizable text
  - Dimensions: 100mm width × 65mm length × 5mm height
  - Features rounded edges and recessed nameplate area
  - Includes magnet holes (2× at 20mm spacing)
  - Supports DXF logo imports

- **`ivu_badge_nameplate.scad`** - Nameplate component for text display
  - White raised nameplate section
  - Customizable text area with orange text styling

- **`magnet_base.scad`** - Magnetic mounting base
  - Dimensions: 35mm × 10mm × 2mm height
  - Two magnet holes for standard circular magnets
  - Pairs with badge for magnetic mounting

### Logos & Graphics
- **`ivu_logo.dxf`** - IVU logo vector graphic

## Features

- **Magnetic Mounting** - Pre-drilled holes for standard round magnets
- **Customizable Text** - Edit text strings and fonts in OpenSCAD
- **Multi-Color Support** - Use ColorSCAD for multi-color printing
- **DXF Logo Integration** - Import vector graphics as logos
  - Use Inkscape to edit the SVG and export it as a DXF12

## Usage

### Basic Compilation
1. Open `ivu_badge_counterfit_v2.scad` in OpenSCAD
2. Customize variables (height, width, length, textStr, textFont)
3. Render and export as STL for 3D printing

### Multi-Color Printing
Use [ColorSCAD](https://github.com/Jonatino/ColorSCAD) to compile with multiple colors:
```bash
colorscad <file.scad> <output.3mf>
```

### Customization Tips
- Change `textStr` variable to customize the main text
- Edit `textFont` for different font styles
- Modify dimension variables (height, width, length) for different badge sizes
- Update DXF file paths to use different logo graphics

## 3D Printing Notes

- **Support Material** - Magnet holes may need support
- **Resolution** - Default $fn = 100 for smooth curves
- **Material** - PLA or PETG recommended for durability
- **Post-Processing** - DON'T USE SUPPORTS. THEY ARE EVIL.