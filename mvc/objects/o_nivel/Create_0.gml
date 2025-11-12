depth = -y;
imge = 19;
idweb = s_idweb_loco(x, y);
fecha = 0;
reloj_sinc = -1;

var tll = 40;
imagen = ds_grid_create(tll, tll);
ds_grid_clear(imagen, c_black);
angulo = 30;

var aux;
var cc = o_control.nivel_celda;
var maxx = 0;
var maxy = 0;
var minx = room_width;
var miny = room_height;
for (var w = 0; w < tll; w++) {
    for (var h = 0; h < tll; h++) {
        aux = instance_create(x - ((tll / 2) * cc) + w * cc,
                y + 24 + h * cc, o_pniv);
        aux.origen = id;
        aux.mx = w;
        aux.my = h;
        maxx = max(maxx, aux.x);
        maxy = max(maxy, aux.y);
        minx = min(minx, aux.x);
        miny = min(miny, aux.y);
    }
}
cenx = mean(maxx, minx);
ceny = mean(maxy, miny);

alarm[0] = 1;
alarm[1] = 2;


