if activo {
    if polo == 0 {
        draw_sprite_ext(d_piezas, 9, x, y - 44, 1, 1, 0, c_black, 1);
    }
    else {
        draw_sprite(d_piezas, 9, x, y - 44);
    }
}


