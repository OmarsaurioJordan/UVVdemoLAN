depth = -y;
imge = 14;
idweb = s_idweb_loco(x, y);
fecha = 0;
reloj_sinc = -1;

turno = 0;
ultimo[0] = 255;
ultimo[1] = 0;
var tll = 6;
tablero = ds_grid_create(tll, tll);
var ca = o_control.celda_ajedrez;
var desf = 0;
var aux;
for (var h = 0; h < tll; h++) {
    for (var w = 0; w < tll; w++) {
        aux = instance_create(x - (tll / 2) * ca + w * ca + desf,
            y + 24 + h * ca * 0.75, o_fichamem);
        ds_grid_add(tablero, w, h, aux);
    }
    desf += ca * 0.2;
}
s_memoria_ini(id);

alarm[0] = 1;


