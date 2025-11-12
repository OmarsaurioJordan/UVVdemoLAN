var a = min(1, lerp(0, 3, reloj_fin / o_control.reloj_pintura));
if color == c_black {
    draw_sprite_ext(d_cosas_game, 35, x, y, 0.5, 0.5, 0, color, a);
}
else {
    draw_sprite_ext(d_cosas_game, 35, x, y, 1, 1, 0, color, a);
}


