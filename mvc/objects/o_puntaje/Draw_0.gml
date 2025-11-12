draw_sprite(d_game, imge, x, y);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_transformed_colour(x - 25, y - 68, string_hash_to_newline(string(puntos[0])),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x + 22, y - 68, string_hash_to_newline(string(puntos[1])),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);

draw_sprite_ext(d_piezas, 14, x, y - 30, 1, 1,
    360 * (reloj_juego / reloj_juego_max) + 90, c_white, 1);


