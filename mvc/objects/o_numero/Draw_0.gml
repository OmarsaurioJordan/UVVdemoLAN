if activo {
    draw_set_valign(fa_bottom);
    draw_set_halign(fa_center);
    var alt = 90 + altu;
    var a = 1 - altu / 40;
    draw_text_transformed_colour(x - 2, y - alt, string_hash_to_newline(texto),
        0.9, 0.9, 0, c_white, c_white, c_white, c_white, a);
    draw_text_transformed_colour(x + 2, y - alt, string_hash_to_newline(texto),
        0.9, 0.9, 0, c_white, c_white, c_white, c_white, a);
    draw_text_transformed_colour(x, y - alt, string_hash_to_newline(texto),
        0.9, 0.9, 0, c_black, c_black, c_black, c_black, a);
}


