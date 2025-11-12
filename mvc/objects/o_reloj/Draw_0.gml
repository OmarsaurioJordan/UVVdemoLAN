draw_sprite(d_core, imge, x, y);

var hh = hora + minuto * (1 / 60);
if hh > 12 {
    hh -= 12;
}
draw_sprite_ext(d_piezas, 14, x - 21, y - 62, 1, 1,
    -360 * (hh / 12) + 90, c_white, 1);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_transformed_colour(x + 17, y - 59, string_hash_to_newline(string(dia)),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
var h = string(hora);
if string_length(h) == 1 {
    h = "0" + h;
}
var m = string(minuto);
if string_length(m) == 1 {
    m = "0" + m;
}

draw_text_transformed_colour(x - 2, y - 27, string_hash_to_newline(semana +
    " " + h + ":" + m),
    0.7, 0.7, 0, c_black, c_black, c_black, c_black, 1);


