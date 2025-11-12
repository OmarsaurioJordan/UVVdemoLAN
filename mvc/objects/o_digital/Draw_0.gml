draw_sprite(d_game, imge, x, y);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_transformed_colour(x - 21, y - 57, string_hash_to_newline(nodos),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);


