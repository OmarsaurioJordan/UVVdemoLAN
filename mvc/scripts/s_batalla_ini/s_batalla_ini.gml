// arg0: id de objeto batalla que reinicia
// son 16 puntos en total

with argument0 {
    ds_grid_clear(barcos, 0);
    ds_grid_clear(tiros, 0);
    // poner barcos
    s_batalla_barco(barcos, 4);
    s_batalla_barco(barcos, 3);
    s_batalla_barco(barcos, 3);
    s_batalla_barco(barcos, 2);
    s_batalla_barco(barcos, 2);
    s_batalla_barco(barcos, 2);
}

