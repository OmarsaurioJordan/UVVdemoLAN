draw_sprite(d_core, imge, x, y);

if o_emisora.texto != "" {
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);
    draw_sprite(d_cosas_core, 0, x, y);
    draw_text_ext_transformed_colour(x + 9, y - 72, string_hash_to_newline(o_emisora.texto),
        13, 90, 0.6, 0.6, 0, c_black, c_black, c_black, c_black, 1);
}


