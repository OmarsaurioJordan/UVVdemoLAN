if tipo == 14 {
    if vecino[1] != noone and vecino[2] != noone {
        draw_sprite(d_circuito, 15, x, y);
    }
    else {
        draw_sprite(d_circuito, 14, x, y);
    }
}
else {
    draw_sprite(d_circuito, tipo, x, y);
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed_colour(x, y - 40, string_hash_to_newline(string(name)),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);

if tipo == 0 and salida != 0 {
    draw_sprite(d_circuito, 16 + valor, x, y);
}


