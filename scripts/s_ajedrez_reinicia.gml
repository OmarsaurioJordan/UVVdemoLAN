// arg0: id instancia ajedrez

with argument0 {
    ds_grid_clear(tablero, "v");
    ds_grid_set(tablero, 0, 0, "f0");
    ds_grid_set(tablero, 1, 0, "c0");
    ds_grid_set(tablero, 2, 0, "a0");
    ds_grid_set(tablero, 3, 0, "d0");
    ds_grid_set(tablero, 4, 0, "g0");
    ds_grid_set(tablero, 5, 0, "a0");
    ds_grid_set(tablero, 6, 0, "c0");
    ds_grid_set(tablero, 7, 0, "f0");
    for (var w = 0; w < 8; w++) {
        ds_grid_set(tablero, w, 1, "m0");
        ds_grid_set(tablero, w, 6, "m1");
    }
    ds_grid_set(tablero, 0, 7, "f1");
    ds_grid_set(tablero, 1, 7, "c1");
    ds_grid_set(tablero, 2, 7, "a1");
    ds_grid_set(tablero, 3, 7, "d1");
    ds_grid_set(tablero, 4, 7, "g1");
    ds_grid_set(tablero, 5, 7, "a1");
    ds_grid_set(tablero, 6, 7, "c1");
    ds_grid_set(tablero, 7, 7, "f1");
    turno = 1;
    turno_max = 1;
    s_ajedrez_fichas(id);
}

