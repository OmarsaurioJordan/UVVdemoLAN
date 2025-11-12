depth = -y;
imge = 6;
idweb = s_idweb_loco(x, y);
fecha = 0;
reloj_sinc = -1;

var tllx = 22; // lado del cuadro
var tlly = 16;
est_nex = ds_grid_create(tllx, tlly);
ds_grid_clear(est_nex, 0);
reloj_max = 1.5; // 0: quieto
regla[0] = "23"; // continuidad
regla[1] = "3"; // nacimiento

reloj_cambio = 0; // no sincronizable
gusanos = ds_grid_create(tllx, tlly);
ds_grid_clear(gusanos, 0);
var aux;
var cc = o_control.juegovida_celda;
for (var w = 0; w < tllx; w++) {
    for (var h = 0; h < tlly; h++) {
        aux = instance_create(x - ((tllx / 2) * cc) + w * cc - 20,
                y + 24 + h * cc, o_gusano);
        aux.origen = id;
        aux.mx = w;
        aux.my = h;
        // iniciar al azar
        if random(1) < 0.5 {
            ds_grid_set(est_nex, w, h, 1);
        }
    }
}
est_act = ds_grid_create(tllx, tlly);
saliente = ds_grid_create(tllx, tlly); // envia datos web
entrante = ds_grid_create(tllx, tlly); // recibe datos web
ds_grid_clear(est_act, 0);
ds_grid_clear(entrante, 0);
ds_grid_clear(saliente, 0);

alarm[0] = 1;


