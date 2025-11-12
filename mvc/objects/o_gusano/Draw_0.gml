var v;
if origen.reloj_max == 0 {
    v = ds_grid_get(origen.est_nex, mx, my);
}
else {
    v = ds_grid_get(origen.gusanos, mx, my);
}
if v != 0 {
    draw_sprite_ext(d_cosas_game, 7, x, y,
        1, v, 0, c_white, 1);
}


