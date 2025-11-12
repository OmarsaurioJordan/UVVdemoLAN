draw_sprite(d_core, imge, x, y);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_transformed_colour(x - 25, y - 30,
    string_hash_to_newline(string(instance_number(o_usuario))),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x + 22, y - 30,
    string_hash_to_newline(string(ds_list_size(o_control.conectados))),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);


