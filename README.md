# Corne Inspired Keyboard Case Modified to use a Raspberry Pi Pico

![](images/pico-corne-left-build05.png)

This repository is a fork of https://github.com/Lenbok/scad-keyboard-cases .
That repository is set up to allow the generation of generalized keyboard cases using
a python script to generate a base OpenSCAD design. In this fork of the Lenbok repository some
steps were skipped there was already and example of a Corne case. I wanted that basic physical layout but 
also adjusted the case to permit the use of the Raspberry Pi Pico microcontroller board.

https://datasheets.raspberrypi.com/pico/pico-datasheet.pdf


	 
## Pico-Corne Keyboard

![](images/pico-corne-left-build04.png)

* Light from RPi Pico board piped outside case by short piece of clear PETG filament.
* Covers over Pico board area allow for customization without reprinting whole case. Also contain side
  vents for convection.

### Construction

![](images/pico-corne-left-build01.png)

![](images/pico-corne-left-build03.png)

![](images/pico-corne-left-build02-und.png)

![](images/pico-corne-left-build03-und-w.png)

![](images/pico-corne-left-build04-und-w.png)

## Firmware

Firmware for this project can be found at https://github.com/danpeirce/pico-corne 

## Accommodate a Larger Microcontroller Board

* The Raspberry Pi Pico is a larger board that the one typically used on a Corne Keyboard. The outline of the board needed 
  to be expanded in the region of the MCU to accommodate the larger size.
    * Old Outline of Case
	  ![crkbd/orig/crkbd-left-bottom.svg](crkbd/orig/crkbd-left-bottom.svg)
    * New Outline of Case
	  ![crkbd/orig/crkbd-left-bottom-mods.svg](crkbd/orig/crkbd-left-bottom-mods.svg)