depth = -y;
imge = 2;
idweb = s_idweb_loco(x, y);
fecha = 0;
reloj_sinc = -1;

imagen = ds_grid_create(64, 64); // no sincronizable
ds_grid_clear(imagen, 0);

fotos = ds_list_create();
aguja = 255; // 255 vacio, comienza en 0

alarm[0] = 1;


