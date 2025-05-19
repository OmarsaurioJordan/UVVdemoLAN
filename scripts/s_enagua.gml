// arg0: posicion x
// arg1: posicion y
// ret: true si esta en agua

var res = false;
var m = instance_nearest(argument0, argument1, o_pnt_piscina);
if point_distance(argument0, argument1, m.x, m.y) < o_control.radio_zona {
    res = true;
}
else {
    m = instance_nearest(argument0, argument1, o_pnt_lago1);
    if point_distance(argument0, argument1, m.x, m.y) < o_control.radio_zona {
        res = true;
    }
    else {
        m = instance_nearest(argument0, argument1, o_pnt_lago2);
        if point_distance(argument0, argument1, m.x, m.y) < o_control.radio_zona {
            res = true;
        }
    }
}
return res;

