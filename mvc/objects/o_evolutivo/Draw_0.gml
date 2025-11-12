draw_sprite(d_game, imge, x, y);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_transformed_colour(x, y - 57, string_hash_to_newline(string(densidad_alimento)),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x + 18, y - 36, string_hash_to_newline(string(fuerza_mutacion)),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x + 18, y - 14, string_hash_to_newline(string(fuerza_recombinacion)),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x - 7, y - 33, string_hash_to_newline(string(num_bichos)),
    0.7, 0.7, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x - 9, y - 14, string_hash_to_newline(string(num_genmax)),
    0.7, 0.7, 0, c_black, c_black, c_black, c_black, 1);


