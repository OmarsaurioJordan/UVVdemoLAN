// verificar que no este en sex
var yop = id;
with o_sex {
    if cercano_A == yop or cercano_B == yop {
        exit;
    }
}
// ahora si dibujar todo
var dsf = -4;
if genero != 0 {
    dsf -= 4;
}
var raza = piel * 6;
// pies
if reloj_pies == 0 {
    draw_sprite(d_avatar, 3 + raza, x, y);
    draw_sprite(d_avatar, 4 + raza, x, y);
}
else {
    var pai, pad;
    switch paso {
        case 1: pai = 0; pad = 6; break;
        case 2: pai = 2; pad = 4; break;
        case 3: pai = 4; pad = 2; break;
        case 4: pai = 6; pad = 0; break;
        case 5: pai = 4; pad = 2; break;
        case 0: pai = 2; pad = 4; break;
    }
    draw_sprite(d_avatar, 3 + raza, x, y - pai);
    draw_sprite(d_avatar, 4 + raza, x, y - pad);
}
// cuerpo
draw_sprite(d_avatar, 1 + genero + raza, x, y + anima[0] + dsf);
var rp = ropa;
if genero == 0 {
    if rp > 3 and collision_circle(x, y, o_control.radio_zona, o_pnt_piscina, true, false) {
        rp = 3;
    }
    draw_sprite_ext(d_ropa_fem, rp, x, y + anima[0] + dsf, 1, 1, 0,
        o_control.colores[tela], 1);
}
else {
    if rp > 2 and collision_circle(x, y, o_control.radio_zona, o_pnt_piscina, true, false) {
        rp = 2;
    }
    if rp <= 1 {
        draw_sprite(d_avatar, 5 + raza, x, y + anima[0] + dsf);
    }
    draw_sprite_ext(d_ropa_masc, rp, x, y + anima[0] + dsf, 1, 1, 0,
        o_control.colores[tela], 1);
}
// cabeza
draw_sprite(d_avatar, raza, x, y + anima[0] + anima[1] + dsf);
if estaonline {
    draw_sprite(d_emocion, emocion, x, y + anima[0] + anima[1] + dsf);
}
else {
    draw_sprite(d_dormido, 0, x, y + anima[0] + anima[1] + dsf);
}
draw_sprite_ext(d_pelo, pelo, x, y + anima[0] + anima[1] + dsf, 1, 1, 0,
    o_control.colores[tinte], 1);
// nombre
draw_set_valign(fa_bottom);
draw_set_halign(fa_center);
var nn = nombre;
if bloqueado {
    nn = "???";
}
draw_text_transformed_colour(x - 2, y + anima[0] + anima[1] - 82 + dsf, string_hash_to_newline(nn),
    0.8, 0.8, 0, c_white, c_white, c_white, c_white, 1);
draw_text_transformed_colour(x + 2, y + anima[0] + anima[1] - 82 + dsf, string_hash_to_newline(nn),
    0.8, 0.8, 0, c_white, c_white, c_white, c_white, 1);
draw_text_transformed_colour(x, y + anima[0] + anima[1] - 82 + dsf, string_hash_to_newline(nn),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
// objeto
if panfleto == "" {
    var ob = true;
    if instance_exists(o_gym) {
        var gym = instance_nearest(x, y, o_gym);
        if gym.cercano == id {
            ob = false;
        }
    }
    if ob {
        draw_sprite(d_objeto, objeto, x, y + anima[0] + anima[2] + dsf);
    }
    else {
        draw_sprite(d_pesa, 0, x, y + anima[0] + anima[2] + dsf);
    }
}
if !bloqueado {
    // panfleto
    if panfleto != "" {
        draw_sprite(d_dialogo, 1, x, y + anima[0] + anima[2] + dsf);
        draw_set_valign(fa_middle);
        draw_set_halign(fa_center);
        draw_text_transformed_colour(x - 12, y + anima[0] + anima[2] - 87 + dsf, string_hash_to_newline(panfleto),
            0.7, 0.7, 0, c_black, c_black, c_black, c_black, 1);
    }
    // expresion
    if estaonline {
        if expresion < 3 {
            draw_sprite(d_expresion, expresion, x, y + anima[0] + anima[1] + anima[3] + dsf);
        }
        else {
            draw_sprite(d_expresion, expresion + piel * 8, x, y + anima[0] + anima[3] + dsf);
        }
    }
    else {
        draw_sprite(d_dormido, 1, x, y + anima[0] + anima[1] + anima[3] + dsf);
    }
    // dialogo
    if propietario and modo_chat {
        draw_sprite_ext(d_dialogo, 0, x, y + anima[0] + anima[1] + dsf,
            1, 1, 0, c_white, 0.5);
        draw_set_valign(fa_middle);
        draw_set_halign(fa_center);
        var res = string_replace(keyboard_string, "#", "");
        while string_height_ext(string_hash_to_newline(res), 13, 90) * 0.6 > 50 or
                string_width_ext(string_hash_to_newline(res), 13, 90) * 0.6 > 64 {
            res = string_copy(res, 1, string_length(res) - 1);
        }
        draw_text_ext_transformed_colour(x + 20, y + anima[0] + anima[1] - 105 + dsf, string_hash_to_newline(res),
            13, 90, 0.6, 0.6, 0, c_black, c_black, c_black, c_black, 1);
    }
    else if dialogo != "" {
        draw_sprite(d_dialogo, 0, x, y + anima[0] + anima[1] + dsf);
        draw_set_valign(fa_middle);
        draw_set_halign(fa_center);
        var ch = string_char_at(dialogo, 1);
        if (ch == "$" or ch == "%") and string_length(dialogo) >= 2 {
            var ok = false;
            var elman = o_control.mipropio;
            if ch == "$" {
                for (var c = 0; c < o_control.total_contactos; c++) {
                    if amigo[c] == elman.idweb {
                        ok = amigi[c] == m_cont_secreto;
                        break;
                    }
                }
            }
            else if elhashtagmin == "" {
                ok = elman.objeto == objeto;
            }
            else {
                ok = elman.elhashtagmin == elhashtagmin;
            }
            if propietario or ok {
                draw_text_ext_transformed_colour(x + 20, y + anima[0] + anima[1] - 105 + dsf,
                    string_hash_to_newline(string_copy(dialogo, 2, string_length(dialogo) - 1)),
                    13, 90, 0.6, 0.6, 0, c_black, c_black, c_black, c_black, 1);
            }
            else {
                draw_text_ext_transformed_colour(x + 20, y + anima[0] + anima[1] - 105 + dsf, string_hash_to_newline("..."),
                    13, 90, 0.6, 0.6, 0, c_black, c_black, c_black, c_black, 1);
            }
        }
        else {
            draw_text_ext_transformed_colour(x + 20, y + anima[0] + anima[1] - 105 + dsf, string_hash_to_newline(dialogo),
                13, 90, 0.6, 0.6, 0, c_black, c_black, c_black, c_black, 1);
        }
    }
}


