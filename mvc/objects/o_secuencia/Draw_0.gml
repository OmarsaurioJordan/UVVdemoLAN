draw_sprite(d_game, imge, x, y);

if repeticion >= string_length(intento) {
    draw_sprite_ext(d_piezas, 16, x, y - 49, 1, 1, 0, c_aqua, 1);
}

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_transformed_colour(x, y - 49,
    string_hash_to_newline(string(string_count("x", secuencia))),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);

var e = 0.7;
draw_text_transformed_colour(x - 22, y - 20, string_hash_to_newline("Z"),
    e, e, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x - 35, y - 48, string_hash_to_newline("X"),
    e, e, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x - 24, y - 74, string_hash_to_newline("C"),
    e, e, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x + 2, y - 80, string_hash_to_newline("V"),
    e, e, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x + 27, y - 74, string_hash_to_newline("B"),
    e, e, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x + 36, y - 49, string_hash_to_newline("N"),
    e, e, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x + 25, y - 24, string_hash_to_newline("M"),
    e, e, 0, c_black, c_black, c_black, c_black, 1);

var ant = "";
var ccc;
if ultima < string_length(secuencia) {
    ccc = c_red;
    ant = string_char_at(secuencia, ultima + 1);
    switch ant {
        case "0": draw_sprite_ext(d_piezas, 16, x - 22, y - 20, 1, 1, 0, ccc, 1); break;
        case "1": draw_sprite_ext(d_piezas, 16, x - 35, y - 48, 1, 1, 0, ccc, 1); break;
        case "2": draw_sprite_ext(d_piezas, 16, x - 24, y - 74, 1, 1, 0, ccc, 1); break;
        case "3": draw_sprite_ext(d_piezas, 16, x + 2, y - 80, 1, 1, 0, ccc, 1); break;
        case "4": draw_sprite_ext(d_piezas, 16, x + 27, y - 74, 1, 1, 0, ccc, 1); break;
        case "5": draw_sprite_ext(d_piezas, 16, x + 36, y - 49, 1, 1, 0, ccc, 1); break;
        case "6": draw_sprite_ext(d_piezas, 16, x + 25, y - 24, 1, 1, 0, ccc, 1); break;
        case "x":
            draw_sprite_ext(d_piezas, 16, x - 22, y - 20, 1, 1, 0, ccc, 1);
            draw_sprite_ext(d_piezas, 16, x - 35, y - 48, 1, 1, 0, ccc, 1);
            draw_sprite_ext(d_piezas, 16, x - 24, y - 74, 1, 1, 0, ccc, 1);
            draw_sprite_ext(d_piezas, 16, x + 2, y - 80, 1, 1, 0, ccc, 1);
            draw_sprite_ext(d_piezas, 16, x + 27, y - 74, 1, 1, 0, ccc, 1);
            draw_sprite_ext(d_piezas, 16, x + 36, y - 49, 1, 1, 0, ccc, 1);
            draw_sprite_ext(d_piezas, 16, x + 25, y - 24, 1, 1, 0, ccc, 1);
            break;
    }
}
else if repeticion < string_length(intento) {
    ccc = c_blue;
    ant = string_char_at(intento, repeticion + 1);
    switch ant {
        case "0": draw_sprite_ext(d_piezas, 16, x - 22, y - 20, 1, 1, 0, ccc, 1); break;
        case "1": draw_sprite_ext(d_piezas, 16, x - 35, y - 48, 1, 1, 0, ccc, 1); break;
        case "2": draw_sprite_ext(d_piezas, 16, x - 24, y - 74, 1, 1, 0, ccc, 1); break;
        case "3": draw_sprite_ext(d_piezas, 16, x + 2, y - 80, 1, 1, 0, ccc, 1); break;
        case "4": draw_sprite_ext(d_piezas, 16, x + 27, y - 74, 1, 1, 0, ccc, 1); break;
        case "5": draw_sprite_ext(d_piezas, 16, x + 36, y - 49, 1, 1, 0, ccc, 1); break;
        case "6": draw_sprite_ext(d_piezas, 16, x + 25, y - 24, 1, 1, 0, ccc, 1); break;
        case "x":
            draw_sprite_ext(d_piezas, 16, x - 22, y - 20, 1, 1, 0, ccc, 1);
            draw_sprite_ext(d_piezas, 16, x - 35, y - 48, 1, 1, 0, ccc, 1);
            draw_sprite_ext(d_piezas, 16, x - 24, y - 74, 1, 1, 0, ccc, 1);
            draw_sprite_ext(d_piezas, 16, x + 2, y - 80, 1, 1, 0, ccc, 1);
            draw_sprite_ext(d_piezas, 16, x + 27, y - 74, 1, 1, 0, ccc, 1);
            draw_sprite_ext(d_piezas, 16, x + 36, y - 49, 1, 1, 0, ccc, 1);
            draw_sprite_ext(d_piezas, 16, x + 25, y - 24, 1, 1, 0, ccc, 1);
            break;
    }
}
if ant != nota_anterior {
    var nn = noone;
    switch ant {
        case "0": nn = a_tono_do; break;
        case "1": nn = a_tono_re; break;
        case "2": nn = a_tono_mi; break;
        case "3": nn = a_tono_fa; break;
        case "4": nn = a_tono_sol; break;
        case "5": nn = a_tono_la; break;
        case "6": nn = a_tono_si; break;
    }
    if nn != noone {
        s_buzzer_nota(x, y, nn, false);
    }
}
nota_anterior = ant;


