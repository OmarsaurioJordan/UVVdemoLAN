depth = -y;
imge = 8;
idweb = s_idweb_loco(x, y);
fecha = 0;
reloj_sinc = -1;

textos = ds_list_create();
repeat 10 {
    ds_list_add(textos, "");
}
leido = 0; // en 1 para comenzar conteo futuro
futuro = 0; // fecha para mostrar nuevo texto

alarm[0] = 1;

