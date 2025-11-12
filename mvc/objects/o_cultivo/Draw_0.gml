draw_sprite(d_game, imge, x, y);

if s_current_time() - ultima_accion > o_control.poder_cultivar {
    draw_sprite(d_cosas_game, 27, x, y);
}
else {
    draw_sprite(d_cosas_game, 26, x, y);
}


