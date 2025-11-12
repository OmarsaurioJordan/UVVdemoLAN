draw_sprite(d_game, imge, x, y);

for (var g = 0; g < 2; g++) {
    for (var m = 0; m < muertos[g]; m++) {
        draw_sprite(d_cosas_game, 28 + g, x, y + m * 3.75);
    }
}

var tff = "B:";
if turno == 0 {
    tff = "N:";
}
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_transformed_colour(x - 24, y - 58, string_hash_to_newline(tff + string(turno_max)),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);


