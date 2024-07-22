# Strain on Static Joint and Cables
 Author: Curran Flanders

Course: ENGR-211

Completion Date: 10/24/2022

## Problem Statement
There is a need for a computer program that simulates a system in which a part is held in place
by a 3D joint and three cables attached to a wall. The user inputs any number of external forces
that act at up to five locations on the part (points A, B, C, D, and E), as well as the locations of
the anchors at which the cables are connected to the wall. The program outputs the tension
forces in the cables and the reaction forces from the 3D joint necessary to keep the part in
static equilibrium

## Variable List
A, B, C, D, F, G, H, I: locations of points A, B, C, D, E, F, and I respectively.

Ff: keeps a running total of the applied forces.

Mf: keeps a running total of the moments of the applied forces.

Fi, Fh, Fg: tensions of cables I, H, and G.

CoefSys: coefficients of the matrix equation.

EqnSys: the matrix equation that when solves gives the tension and reaction forces.

answer: the solution matrix containing the tension and reaction forces.

number of forces: the total number of forces that the user wishes to apply to the part

pos: the position of an individual force entered by the user

magnitude: the magnitude of a force entered in magnitude-angle form

form: contains 1 if the user chose component form and 2 for magnitude-angle form

alpha, beta, gamma: the direction angles of the entered force

x, y, z: the components of the entered force

## Physical Faults of Program Output
The program will sometimes output a negative value for a tension force, meaning that the cable
is in compression. The simplest fix would be to adjust the direction of the net force so that it
points in the positive x and negatiWhat if all anchors are in the same quadrant?ve y directions.

## What if all anchors are in the same quadrant?
In this case, the resultant force must point in the quadrant opposite that of the anchors to
avoid compression.

