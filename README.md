# LifeOSXNasm32
A 32bit implementation of Conway's Game of Life using XCode, Nasm assembly, and OpenGL for OSX.

## Overview

This is an assembly and OpenGL based implementation of Conway's Game of Life for OSX. The assembly file is automatically linked with the executable with Nasm/XCode.
No special configuration is needed, but the project must be built using the architecture `32-bit Intel (i386)`. This project serves as an example of how to interface Nasm, assembly, and OpenGL in OSX via XCode for the Intel i386 32bit architecture. It also serves as a way to learn about compiler calling conventions in XCode/LLVM. eg. Passing parameters in registers vs the stack etc.

## To Build

Open in XCode and build and run as is.

## Usage

Click and drag down and right on the screen to add cells to the game.

