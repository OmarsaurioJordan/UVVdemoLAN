draw_sprite(d_core, imge, x, y);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_transformed_colour(x + 24, y - 28, string_hash_to_newline(string(ds_list_size(notas))),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
if ds_list_size(preguntas) > 1 {
    draw_sprite(d_cosas_core, 35, x, y);
}
var cmb = 0;
for (var i = 0; i < 5; i++) {
    draw_sprite_ext(d_barranotas, cmb, x - 34, y - (52 + 34 * (i / 4)),
        grafica[i], 1, 0, c_white, 1);
    if cmb == 0 {
        cmb = 1;
    }
    else {
        cmb = 0;
    }
}


