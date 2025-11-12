draw_sprite(d_game, imge, x, y);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
var tit = "";
switch tipo {
    case 0: tit = "Seno"; break;
    case 1: tit = "Triangu."; break;
    case 2: tit = "Cuadrada"; break;
    case 3: tit = "Diente S"; break;
    case 4: tit = "Diente B"; break;
    case 5: tit = "Azar"; break;
}
draw_text_transformed_colour(x - 11, y - 73, string_hash_to_newline(tit),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x - 24, y - 43, string_hash_to_newline(string(amplitud)),
    0.7, 0.7, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x - 7, y - 43, string_hash_to_newline(string(frecuencia)),
    0.7, 0.7, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x + 10, y - 43, string_hash_to_newline(string(desfase)),
    0.7, 0.7, 0, c_black, c_black, c_black, c_black, 1);


