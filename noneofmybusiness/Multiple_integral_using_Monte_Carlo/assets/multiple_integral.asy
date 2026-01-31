import three;
import math;
import graph3;
import solids;
// import contour3;
// import settings;
settings.prc=false;
// settings.webgl2=true;
// currentlight=Viewport;
// currentlight=(5,1,2);
texpreamble("\usepackage{bm, amsmath}");

size(15cm);

xaxis3("$x$", xmin=0, xmax=8, red, Arrow3);
yaxis3("$y$", ymin=0, ymax=9, blue, Arrow3);
zaxis3("$z$", zmin=0, zmax=5, deepgreen, Arrow3);

currentprojection = orthographic((5, 1, 2));

real step = 1;
real max_x = 7;
real max_y = 9;
pen gridPen = gray(0.85) + linewidth(0.5)+dashed;
for (real x = 1; x <= max_x; x+= step) {
  draw((x, 0, 0) -- (x, max_y, 0), gridPen);
}
for (real y = 1; y <= max_y; y+= step) {
  draw((0, y, 0) -- (max_x, y, 0), gridPen);
}

draw((3,3,0)--(3,3,3),mediumgray+dashed+thick());
draw((3,4,0)--(3,4,cos(1)+2),mediumgray+dashed+thick());
draw((4,3,0)--(4,3,cos(1)+2),mediumgray+dashed+thick());
draw((4,4,0)--(4,4,3),mediumgray+dashed+thick());
draw((3,3,0)--(3,4,0)--(4,4,0)--(4,3,0)--cycle);

draw((3.5,3.5,0)--(3.5,3.5,3), black+dotted);
draw((3.5,3.5,0), green+5);
draw((3.5,3.5,3), green+5);


surface parametric_surface(real f(pair), pair p_start, pair p_end){
  triple parametrify(pair p) {
	real r = p.x;
	real theta = p.y;

	real x = r * cos(theta);
	real y = r * sin(theta);
	return (x, y, f((x,y)));
  }
  return surface(parametrify, p_start, p_end, nu=40, nv=40, Spline);
}

real a_surface(pair z) { return cos(abs(z.x^2 - z.y^2)); }

draw(shift(3,3,2)*surface(parametric_surface(a_surface, (0,0), (2,2pi))), green+opacity(0.1), render(merge=true));

draw(circle((3,3,0),2,Z), darkgreen);
draw((5,3,0)--(5,3,cos(4)+2), mediumgray+dashed);
draw((3,1,0)--(3,1,cos(4)+2), mediumgray+dashed);
draw((1,3,0)--(1,3,cos(4)+2), mediumgray+dashed);
draw((3,5,0)--(3,5,cos(4)+2), mediumgray+dashed);
// surface ds = surface(f,(0,0),(1,1), Spline);
draw(shift(3,3,2)*surface(a_surface, (0,0), (1,1), Spline ), meshpen=black+dashed, fuchsia+opacity(0.8), render(merge=true));

real down_sphere_surface(pair z) { return -sqrt(abs(4 - z.x^2 - z.y^2 )); }
real up_sphere_surface(pair z) { return sqrt(abs(4 - z.x^2 - z.y^2 )); }

draw(shift(3,7,2)*surface(up_sphere_surface, (-1,-1), (1,1), Spline), meshpen=black+dashed, lightblue+opacity(0.8), render(merge=true));
draw(shift(3,7,3)*surface(down_sphere_surface, (-1,-1), (0,0), Spline), meshpen=black+dashed, lightblue+opacity(0.8), render(merge=true));
draw(shift(3,7,3)*surface(down_sphere_surface, (-1,0), (1,1), Spline), meshpen=black+dashed, lightblue+opacity(0.8), render(merge=true));
draw(shift(3,7,3)*surface(down_sphere_surface, (0,-1), (1,0), Spline), meshpen=black+dashed, fuchsia+opacity(0.8), render(merge=true));

draw((2,6,0)--(2,6,3-sqrt(2)), mediumgray+dashed+thick());
draw((4,6,0)--(4,6,2.5), mediumgray+dashed+thick());
draw((2,8,0)--(2,8,3-sqrt(2)), mediumgray+dashed+thick());
draw((4,8,0)--(4,8,3-sqrt(2)), mediumgray+dashed+thick());
draw((3,6,0)--(3,6,2.5), mediumgray+dashed+thick());
draw((4,7,0)--(4,7,2.5), mediumgray+dashed+thick());
draw((3,7,0)--(3,7,2.5), mediumgray+dashed+thick());

draw((2,6,0)--(4,6,0)--(4,8,0)--(2,8,0)--cycle, blue);
draw((3,6,0)--(4,6,0)--(4,7,0)--(3,7,0)--cycle);

real h = sqrt(2);
real r = sqrt(3);

triple Right_Bottom_1 = ( 0, 1,  -h );
triple Right_Top_1    = ( 0,  1, h );
triple Left_Top_1     = ( 0, -1, h );
triple Left_Bottom_1  = ( 0, -1, -h );

triple Mid_Bottom   = ( 0, 0, -r);
triple Mid_Top   = ( 0, 0, r);

triple Right_Bottom_2 = (  1, 0, -h );
triple Right_Top_2    = (  1, 0, h );
triple Left_Top_2     = ( -1, 0, h );
triple Left_Bottom_2  = ( -1, 0, -h );

// triple Mid_Bottom_1 = ( 1, 0, -r);
// triple Mid_Top_1 = ( 1, 0, r);
triple Mid_Bottom_2 = ( 0, 0, -2);
triple Mid_Top_2 = ( 0, 0, 2);

path3 path_1 = shift(0,0,0.5)*arc(O, Left_Bottom_1, Right_Bottom_1, X)
  -- Right_Top_1
  -- shift(0,0,-0.5)*arc(O, Right_Top_1, Left_Top_1, X)
  -- cycle;

path3 path_2 = shift(0,0,0.5)*Arc(O, Right_Bottom_2, Left_Bottom_2, Y)
  -- Left_Top_2
  -- shift(0,0,-0.5)*Arc(O, Left_Top_2, Right_Top_2, Y)
  -- cycle;

path3 path_3 = shift(0,0,0.5)*arc(O,Left_Bottom_1, Mid_Bottom  , X)
  -- O
  -- (0,-1,0)
  -- cycle;

path3 path_4 = shift(0,0,0.5)*arc(O, Right_Bottom_2, Mid_Bottom  , Y)
  -- O
  -- (1,0,0)
  -- cycle;

path3 path_5 = shift(0,0,0.5)*arc(O, (0,-1,-r), Mid_Bottom_2, X)
  -- O
  -- (0,-1,0)
  -- cycle;

path3 path_6 = shift(0,0,0.5)*arc(O, (1,0,-r), Mid_Bottom_2, Y)
  -- O
  -- (1,0,0)
  -- cycle;

surface sq = surface((0,0,0)--(0,1,0)--(1,1,0)--(1,0,0)--cycle);

path3 gong_1 = shift(0,0,-0.5)*arc(O, Right_Top_1, Left_Top_1, X)
  -- (0,-1,0)
  -- (0,1,0)
  -- cycle;

path3 gong_2 = shift(0,0,-0.5)*arc(O, Left_Top_2, Right_Top_2, Y)
  -- (1,0,0)
  -- (-1,0,0)
  -- cycle;

path3 gong_3 = shift(0,0,0.5)*arc(O, Mid_Bottom, Right_Bottom_1, X)
  -- (0,1,0)
  -- O
  -- cycle;

path3 gong_4 = shift(0,0,0.5)*arc(O, Mid_Bottom, Left_Bottom_2, Y)
  -- (-1,0,0)
  -- O
  -- cycle;


// draw(shift(4,7,2.5)*surface(path_1), surfacepen=emissive(lightblue + opacity(0.8)));
// draw(shift(3,6,2.5)*surface(path_2), surfacepen=emissive(lightblue + opacity(0.8)));

draw(shift(2,7,2.5)*surface(path_1), surfacepen=emissive(lightblue + opacity(0.8)));
draw(shift(3,8,2.5)*surface(path_2), surfacepen=emissive(lightblue + opacity(0.8)));
draw(shift(4,7,2.5)*surface(gong_1), surfacepen=emissive(lightblue + opacity(0.8)));
draw(shift(3,6,2.5)*surface(gong_2), surfacepen=emissive(lightblue + opacity(0.8)));
draw(shift(4,7,2.5)*surface(gong_3), surfacepen=emissive(lightblue + opacity(0.8)));
draw(shift(3,6,2.5)*surface(gong_4), surfacepen=emissive(lightblue + opacity(0.8)));

draw(shift(4,7,2.5)*surface(path_3), surfacepen=fuchsia+opacity(0.8));
draw(shift(3,6,2.5)*surface(path_4), surfacepen=fuchsia+opacity(0.8));
draw(shift(3,7,2.5)*surface(path_5), surfacepen=fuchsia+opacity(0.8));
draw(shift(3,7,2.5)*surface(path_6), surfacepen=fuchsia+opacity(0.8));
draw(shift(3,6,2.5)*sq, surfacepen=fuchsia+opacity(0.8));

draw((3.5,6.5,0)--(3.5,6.5,2.5), black+dotted);
draw((3.5,6.5,0), green+5);
draw((3.5,6.5,2.5), green+5);
