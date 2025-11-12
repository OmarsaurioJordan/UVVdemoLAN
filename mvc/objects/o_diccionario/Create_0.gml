depth = -y;
imge = 9;
idweb = s_idweb_loco(x, y);
fecha = 0;
reloj_sinc = -1;

imagen = ds_grid_create(20, 30); // no sincronizable
ds_grid_clear(imagen, 0);
solo_aguja = false;
orden_mensaje = -1; // para edicion por el usuario
imagen_vacia = true;

titulos = ds_list_create();
fotos = ds_list_create();
infos = ds_list_create();
repeat 100 {
    ds_list_add(titulos, "");
    ds_list_add(fotos, "");
    ds_list_add(infos, "");
}
aguja = 0;

alarm[0] = 1;


