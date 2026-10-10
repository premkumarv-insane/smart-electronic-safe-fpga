# Smart Electronic Safe with Multi-Step Authentication

## Overview
A Verilog-based digital safe controller implemented on the Cyclone II EP2C8T144C8 FPGA using Quartus II 13.0 SP1.

## Features
- Four-step authentication sequence
- Finite State Machine (FSM) based control
- Incorrect password sequence detection
- LOCKED, AUTHENTICATING, OPEN, and ERROR status LEDs
- Reset-based recovery

## Authentication Sequence
1. `1011`
2. `0110`
3. `1101`
4. `0011`

The safe enters the OPEN state only after all four codes are entered in the correct order.

## Hardware and Tools
- FPGA: Cyclone II EP2C8T144C8
- HDL: Verilog
- Design software: Quartus II 13.0 SP1
- Simulation: ModelSim (if used)

## Project Structure
- `smart_electronic_safe.v` — RTL source code
- `smart_electronic_safe.qsf` — Pin assignments
- `smart_electronic_safe.qpf` — Quartus project file
- `simulation/` — Testbench and simulation files, if available

## Learning Objectives
This project demonstrates FSM design, sequential logic, input validation, state transitions, and FPGA pin assignment.

## Limitations
This is an educational prototype. The current implementation uses a manual ENTER/clock input. Mechanical switch debouncing and a dedicated system-clock implementation are recommended for improved reliability.
