draw_sprite(d_game, imge, x, y);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_transformed_colour(x - 25, y - 42, string_hash_to_newline(string(mortandad)),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x + 3, y - 42, string_hash_to_newline(string(transmision)),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x - 27, y - 16, string_hash_to_newline(string(incubacion)),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x, y - 16, string_hash_to_newline(string(enfermedad)),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x + 5, y - 76,
    string_hash_to_newline(string(infectados) + " / " + string(muertos)),
    0.7, 0.7, 0, c_black, c_black, c_black, c_black, 1);


