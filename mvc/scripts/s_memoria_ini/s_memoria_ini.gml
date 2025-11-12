// arg0: id de instancia juego memoria que reinicia fichas

with argument0 {
    turno = 0;
    ultimo[0] = 255;
    ultimo[1] = 0;
    var tll = ds_grid_width(tablero);
    var bolsa = ds_grid_create(tll, tll);
    var list = ds_list_create();
    for (var i = 0; i < sprite_get_number(d_fichamem); i++) {
        ds_list_add(list, i);
    }
    ds_list_shuffle(list);
    var n = 0;
    for (var h = 0; h < tll / 2; h++) {
        for (var w = 0; w < tll; w++) {
            ds_grid_set(bolsa, w, h, ds_list_find_value(list, n));
            n++;
        }
    }
    n = 0;
    for (var h = tll / 2; h < tll; h++) {
        for (var w = 0; w < tll; w++) {
            ds_grid_set(bolsa, w, h, ds_list_find_value(list, n));
            n++;
        }
    }
    ds_grid_shuffle(bolsa);
    var aux;
    for (var h = 0; h < tll; h++) {
        for (var w = 0; w < tll; w++) {
            aux = ds_grid_get(tablero, w, h);
            aux.tipo = ds_grid_get(bolsa, w, h);
            aux.mostrado = 0;
        }
    }
    ds_list_destroy(list);
    ds_grid_destroy(bolsa);
}

