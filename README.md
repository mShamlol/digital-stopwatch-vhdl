# Digital Stopwatch Design

A digital stopwatch implemented using digital logic simulation and VHDL.

## Overview

The project implements a stopwatch capable of counting up to 59:59 minutes and seconds.

The design was developed using:
- Multisim for hardware simulation
- Vivado for VHDL implementation and verification

## Features

- MM:SS time display format
- Start/Stop control
- Reset functionality
- Cascaded BCD counters
- 7-segment display output
- VHDL testbench verification

## Hardware Implementation

The Multisim circuit uses:

- 74LS90 BCD counters
- 7447 BCD-to-7 segment decoders
- 7-segment displays
- Logic gates
- Clock generator

## VHDL Implementation

Files:

- `stopwatch.vhd` - Main stopwatch design
- `stopwatch_tb.vhd` - Simulation testbench

## Documentation

The complete project report can be found here:

`Stopwatch DLD Project.pdf`

## Results

The simulation verified:
- Correct counting sequence
- Proper reset behavior
- Correct carry propagation between counters
