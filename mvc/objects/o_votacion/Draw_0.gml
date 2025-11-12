draw_sprite(d_core, imge, x, y);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
var lond = ds_list_size(derecha);
var loni = ds_list_size(izquierda);
draw_text_transformed_colour(x, y - 16, string_hash_to_newline(string(lond + loni)),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
draw_text_ext_transformed_colour(x, y - 59, string_hash_to_newline(pregunta),
    13, 96, 0.6, 0.6, 0, c_black, c_black, c_black, c_black, 1);
var e = loni / (lond + loni);
draw_sprite_ext(d_cosas_core, 33, x - 41, y - 14, 1, e, 0, c_white, 1);
e = lond / (lond + loni);
draw_sprite_ext(d_cosas_core, 34, x + 39, y - 14, 1, e, 0, c_white, 1);


