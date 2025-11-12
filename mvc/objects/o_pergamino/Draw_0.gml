draw_sprite(d_core, imge, x, y);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_ext_transformed_colour(x, y - 57, string_hash_to_newline(texto),
    13, 128, 0.6, 0.6, 0, c_black, c_black, c_black, c_black, 1);
if textote != "" {
    draw_sprite(d_cosas_core, 32, x, y);
}


