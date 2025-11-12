depth = -y;
imge = 25;
idweb = s_idweb_loco(x, y);
fecha = 0;
reloj_sinc = -1;

imagen = ds_grid_create(40, 40);
transp = ds_grid_create(40, 40);
ds_grid_clear(imagen, c_black);
ds_grid_clear(transp, 0);

var ca = o_control.celda_lienzo;
var aux;
for (var h = 0; h < 40; h++) {
    for (var w = 0; w < 40; w++) {
        aux = instance_create(x - 20 * ca + w * ca,
            y + 20 + h * ca * 0.75, o_alfum);
        aux.origen = id;
        aux.posw = w;
        aux.posh = h;
    }
}

alarm[0] = 1;


