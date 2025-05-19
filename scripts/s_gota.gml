// crea una gota de agua lluvia

var xx = random_range(view_xview[0] - 200, view_xview[0] + view_wview[0] + 200);
var yy = random_range(view_yview[0] - 100, view_yview[0] + view_hview[0] + 300);
var tch = instance_nearest(xx, yy, o_pnt_techo);
if point_distance(xx, yy, tch.x, tch.y) < o_control.radio_zona {
    exit;
}
with o_gota {
    if !activo {
        activo = true;
        altura = 200 + random(20);
        reloj_fin = 90;
        x = xx;
        y = yy;
        depth = -y;
        exit;
    }
}
instance_create(xx, yy, o_gota);

