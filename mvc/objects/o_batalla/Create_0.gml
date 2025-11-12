depth = -y;
imge = 19;
idweb = s_idweb_loco(x, y);
fecha = 0;
reloj_sinc = -1;

barcos = ds_grid_create(8, 8);
tiros = ds_grid_create(8, 8);
s_batalla_ini(id);

var ca = o_control.celda_ajedrez;
var desf = 0;
var aux;
for (var h = 0; h < 8; h++) {
    for (var w = 0; w < 8; w++) {
        aux = instance_create(x - 4 * ca + w * ca + desf,
            y + 24 + h * ca * 0.75, o_barco);
        aux.posw = w;
        aux.posh = h;
    }
    desf += ca * 0.2;
}

s_batalla_ficha();
reloj_parti = random(20);

alarm[0] = 1;


