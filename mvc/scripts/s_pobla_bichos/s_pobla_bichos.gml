// arg0: id de objeto evolutivo que crea
// arg1: true crear bicho, false alimento
// ret: id de instancia creada o noone

var res = noone;
with argument0 {
    var neabos;
    var fren = 0;
    var xx, yy;
    do {
        xx = x + random_range(-__view_get( e__VW.WView, 0 ) * 2, __view_get( e__VW.WView, 0 ) * 2);
        yy = y + random_range(-__view_get( e__VW.HView, 0 ), __view_get( e__VW.HView, 0 ) * 3);
        neabos = instance_nearest(xx, yy, o_pnt_lago2);
        fren++;
    }
    until (point_distance(xx, yy, neabos.x, neabos.y) < o_control.radio_zona and
        !collision_circle(xx, yy, 36, o_bicho, true, false)) or fren >= 50;
    if fren < 50 {
        if argument1 {
            res = instance_create(xx, yy, o_bicho);
        }
        else {
            res = instance_create(xx, yy, o_alimento);
        }
    }
}
return res;

