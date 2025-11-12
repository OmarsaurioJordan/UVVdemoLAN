depth = -y;
imge = 0;
idweb = s_idweb_loco(x, y);
fecha = 0;
reloj_sinc = -1;
turno_sinc = 0;
file_sinc = 0;

archivos = ds_list_create();
for (var a = 0; a < 9; a++) {
    ds_list_add(archivos, ds_list_create());
    fechas[a] = 0;
}

alarm[0] = 1;


