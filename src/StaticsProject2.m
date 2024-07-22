%% Programming Assignment 2 ~ Engineering Statics

%% Hardcodes the locations of points A-F with A as the origin
A = [0,0,0];
B = [450,0,0];
C = [650,0,0];
D = [650,200,0];
E = [450,80,0];
F = [450,0,60];
Ff = [0,0,0];
Mf = [0,0,0];

%% Lets the user enter any number of forces acting on the part
number_of_forces = input("enter the number of additional forces applied on the part");
for i = 1:number_of_forces
    pos = input("enter the position of the force (capital A, B, C, D, E, or F)");
    form=input("enter 1 for component form or 2 for polar form");
    
    if (form==1)
        xyz = [input("enter the x component"),input("enter the y component"),input("enter the z component")];
    elseif (form == 2)
        magnitude = input("enter the magnitude");
        alpha = input("enter angle alpha in degrees");
        beta = input("enter angle beta in degrees");
        gamma = input("enter angle gamma in degrees");
        xyz = [magnitude*cosd(alpha), magnitude*cosd(beta), magnitude*cosd(gamma)];
    end
    Ff = Ff + xyz;
    Mf = Mf + cross(pos,xyz);
end



%% Lets the user enter the positions of the anchors
disp("enter the x, y, and z coordinates of the following anchor positions within brackets and separated by commas (example: [0,50,300])")
G = input("enter the position of G");
H = input("enter the position of H");
I = input("enter the position of I");


%% Calculates the coefficients for the A term of the XA = B matrix equation
%% (X is the 1x6 solution matrix, A is the 6x6 matrix determined by the positions of
%% the cables, B is the 1x6 matrix determined by the forces entered by the user)
%% I use XA = B rather than AX = B because I arbitrarily made A and B horizontal rather than vertical
Fi = (I-D)/norm(I-D);
Fh = (H-E)/norm(H-E);
Fg = (G-F)/norm(G-F);
Mi = cross(D-A,Fi);
Mh = cross(E-A,Fh);
Mg = cross(F-A,Fg);

%% EqnSys is the X term of the XA = B equation 
EqnSys = [
    Fi(1),Fh(1),Fg(1),1,0,0;
    Fi(2),Fh(2),Fg(2),0,1,0;
    Fi(3),Fh(3),Fg(3),0,0,1;
    Mi(1),Mh(1),Mg(1),0,0,0;
    Mi(2),Mh(2),Mg(2),0,0,0;
    Mi(3),Mh(3),Mg(3),0,0,0];

%% CoefSys is the B term of the XA = B equation
CoefSys = [-Ff(1);-Ff(2);-Ff(3);-Mf(1);-Mf(2);-Mf(3)];

%% We find the solution vector X of the XA = B equation
answer = EqnSys\CoefSys;

%% The solution is printed to the user
fprintf("\n");
disp("Ti = " + answer(1));
disp("Th = " + answer(2));
disp("Tg = " + answer(3));
disp("Ax = " + answer(4));
disp("Ay = " + answer(5));
disp("Az = " + answer(6));
