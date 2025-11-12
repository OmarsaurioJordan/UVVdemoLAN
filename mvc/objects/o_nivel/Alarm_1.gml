/// @description  angulo

var yop = id;
var vvv, ddd;
with o_pniv {
    if origen == yop {
        vvv = point_distance(yop.cenx, yop.ceny, xstart, ystart);
        ddd = point_direction(yop.cenx, yop.ceny, xstart, ystart);
        ddd += yop.angulo;
        x = yop.cenx + lengthdir_x(vvv, ddd);
        y = yop.ceny + lengthdir_y(vvv, ddd);
        depth = -y;
    }
}


