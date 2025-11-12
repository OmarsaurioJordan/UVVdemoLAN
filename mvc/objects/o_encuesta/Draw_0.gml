draw_sprite(d_core, imge, x, y);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
var est = ds_list_size(estudiantes);
draw_text_transformed_colour(x + 24, y - 28, string_hash_to_newline(string(est)),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
if ds_list_size(preguntas) > 1 {
    draw_sprite(d_cosas_core, 36, x, y);
}
var cmb = 0;
var tot = o_control.encuesta_max - 1;
if est != 0 {
    draw_sprite_ext(d_barranotas, 1, x - 39, y - 47,
        (genero / est) * 0.6, 1, 90, c_white, 1);
}
for (var i = 0; i <= tot; i++) {
    draw_sprite_ext(d_barranotas, cmb, x - 31 + 65 * (i / tot), y - 47,
        grafica[i] * 0.6, 1, 90, c_white, 1);
    if cmb == 0 {
        cmb = 1;
    }
    else {
        cmb = 0;
    }
}


