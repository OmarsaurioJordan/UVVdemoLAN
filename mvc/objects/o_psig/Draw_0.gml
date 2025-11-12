if activo {
    var v = 1 - clamp((x - orix) / o_control.signal_dist, 0, 1);
    draw_sprite_ext(d_piezas, 8, x, y - altura, 1, 1, 0,
        merge_colour(c_black, c_red, v), v);
}


