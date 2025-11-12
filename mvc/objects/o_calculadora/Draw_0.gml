with (o_calculadora) {
draw_sprite(d_game, imge, x, y);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
if s_current_time() - fecha > 1 {
    draw_text_transformed_colour(x - 4, y - 73, string_hash_to_newline(pregunta),
        0.7, 0.7, 0, c_black, c_black, c_black, c_black, 1);
    draw_text_transformed_colour(x - 19, y - 44, string_hash_to_newline(respuesta[0]),
        0.7, 0.7, 0, c_black, c_black, c_black, c_black, 1);
    draw_text_transformed_colour(x + 17, y - 44, string_hash_to_newline(respuesta[1]),
        0.7, 0.7, 0, c_black, c_black, c_black, c_black, 1);
    draw_text_transformed_colour(x - 18, y - 21, string_hash_to_newline(respuesta[2]),
        0.7, 0.7, 0, c_black, c_black, c_black, c_black, 1);
    draw_text_transformed_colour(x + 17, y - 20, string_hash_to_newline(respuesta[3]),
        0.7, 0.7, 0, c_black, c_black, c_black, c_black, 1);
}
else {
    draw_text_transformed_colour(x - 4, y - 73, string_hash_to_newline("???"),
        0.7, 0.7, 0, c_black, c_black, c_black, c_black, 1);
}

draw_sprite(d_cosas_game, 31, x, y - 60 * (puntos[0] / o_control.calculadora_puntos));
draw_sprite(d_cosas_game, 32, x, y - 60 * (puntos[1] / o_control.calculadora_puntos));


}
