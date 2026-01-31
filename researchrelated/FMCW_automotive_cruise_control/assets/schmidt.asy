import three;
import graph3;
// import settings;
settings.prc = false;
settings.webgl2 = true;

size(600);
usepackage("amsmath, bm");
// limits((-1,-1,0),(6,6,0));
// grid3(gridroutine=XYXgrid, step=0.5, pGrid=gray+dotted, pgrid=nullpen);

currentprojection = orthographic((0.6,-0.8,0.4));

real step = 1;
real max_x = 4;
real max_y = 4;
pen gridPen = gray(0.8) + linewidth(0.5)+ dashed;
for (real x = 1; x <= max_x; x+= step) {
  draw((x, 0, 0) -- (x, max_y, 0), gridPen);
}
for (real y = 1; y <= max_y; y+= step) {
  draw((0, y, 0) -- (max_x, y, 0), gridPen);
}

triple a3_end = (3,4,5);
triple a2_end = (1,5,0);
triple a1_end = (4,0,0);

triple C = (3,4,0);
draw(O, black+3, L=Label("$O$", align=NW));
// draw(O--C, dashed+gray);
draw(O--a3_end, blue, L=Label("$\alpha_3$", align=NW, position=0.5), Arrow3);
draw(O--a2_end, lightolive, L=Label("$\alpha_2$",align=S, position=0.5), Arrow3);
draw(O--a1_end, red, L=Label("$\beta_1 = \alpha_1$", align=SW, position=0.5), Arrow3);

triple per_C_OX = O + dot(C-O, dir(O--X))*dir(O--X);
triple per_C_OY = O + dot(C-O, dir(O--Y))*dir(O--Y);

draw(per_C_OX--C, gray+dashed, L =Label("$\displaystyle{\frac{\langle\vec{\beta_2}, \vec{\alpha_3}\rangle}{\langle\vec{\beta_2}, \vec{\beta_2}\rangle}\vec{\beta_2}}$",align=N,black, position=0.4), Arrow3);
draw(per_C_OY--C, gray+dashed, L=Label("$\displaystyle{\frac{\langle\vec{\beta_1}, \vec{\alpha_3}\rangle}{\langle\vec{\beta_1}, \vec{\beta_1}\rangle}\vec\beta_1}$",NE,black, position=0.7), Arrow3);

real s = 0.1;
triple u = unit(C-per_C_OX);
triple v = unit(O-X);
draw(per_C_OX+s*u -- per_C_OX+s*u+s*v -- per_C_OX+s*v, gray);
triple u = unit(C-per_C_OY);
triple v = unit(O-Y);
draw(per_C_OY+s*u -- per_C_OY+s*u+s*v -- per_C_OY+s*v, gray);

draw(C--a3_end, heavycyan, L=Label("$\displaystyle{\beta_3 = \alpha_3 - \frac{\langle\vec{\beta_1}, \vec{\alpha_3}\rangle}{\langle\vec{\beta_1}, \vec{\beta_1}\rangle}\vec\beta_1 - \frac{\langle\vec{\beta_2}, \vec{\alpha_3}\rangle}{\langle\vec{\beta_2}, \vec{\beta_2}\rangle}\vec\beta_2}$", position=0.5), Arrow3);

triple per_a2_end_OY = O + dot(a2_end-O, dir(O--Y))*dir(O--Y);

draw(per_a2_end_OY--a2_end, gray+dashed, L=Label("$\displaystyle{\frac{\langle\vec\beta_1, \vec\alpha_2\rangle}{\langle\vec\beta_1, \vec\beta_1\rangle}\vec\beta_1}$", NE, black, position=0.2), Arrow3);
draw(L = Label("$\displaystyle{\beta_2=\alpha_2 - \frac{\langle\vec\beta_1, \vec\alpha_2\rangle}{\langle\vec\beta_1, \vec\beta_1\rangle}\vec\beta_1}$", align=N, position=0.5),O--per_a2_end_OY, heavygreen, Arrow3);
triple u = unit(a2_end-per_a2_end_OY);
triple v = unit(O-Y);
draw(per_a2_end_OY+s*u -- per_a2_end_OY+s*u+s*v -- per_a2_end_OY+s*v, gray);
