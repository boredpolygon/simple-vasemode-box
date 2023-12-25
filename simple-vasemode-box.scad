
w_in = 3;
l_in = 3;
h_in = 3;
round_in = .25;
N = 8;
M = 8;

$fn=300;
w = w_in*25.4;
l = l_in*25.4;
h = h_in*25.4;
round_mm = round_in*25.4;


difference()
{
    minkowski() {
    cube([w-round_mm,l-round_mm,h-round_mm]);
    sphere(round_mm/2);
    }

for (i = [1:N-1]){
    offset = i*w/N;
    translate([offset, -round_mm/2, -round_mm/2]) cylinder(h=h+round_mm,r=round_mm/2);
    translate([offset, l-round_mm/2, -round_mm/2]) cylinder(h=h+round_mm,r=round_mm/2);
}

for (i = [1:M-1]){
    offset = i*l/M;
    translate([-round_mm/2,offset, -round_mm/2]) cylinder(h=h+round_mm,r=round_mm/2);
    translate([w-round_mm/2, offset, round_mm/2]) cylinder(h=h+round_mm,r=round_mm/2);
}
}