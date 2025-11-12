/// @description  sombras

// baldozas base editor
if m_editor {
    with o_baldoza {
        draw_sprite_ext(d_baldoza, subimagen, x, y,
            1, 1, 0, o_control.colores[colorsito], 0.8);
    }
}

// imagen alfombra
with o_alfum {
    if visible {
        draw_sprite_ext(d_sombra, 17, x, y, 1, 1, 0,
            ds_grid_get(origen.imagen, posw, posh),
            ds_grid_get(origen.transp, posw, posh) * 0.8);
    }
}

// casillas ajedrez
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
with o_ajedrez {
    if visible {
        var ca = o_control.celda_ajedrez;
        var desf = 0;
        var cmb = 0;
        var ltt;
        for (var h = 0; h < 8; h++) {
            for (var w = 0; w < 8; w++) {
                if cmb == 0 {
                    cmb = 1;
                }
                else {
                    cmb = 0;
                }
                draw_sprite(d_sombra, 7 + cmb,
                    x - 4 * ca + w * ca + desf,
                    y + 24 + h * ca * 0.75);
                if w == 0 {
                    draw_text_transformed_colour(x - 4 * ca + -1 * ca + desf,
                        y + 24 + h * ca * 0.75, string_hash_to_newline(string(8 - h)), 0.7, 0.7, 0,
                        c_black, c_black, c_black, c_black, 0.8);
                }
                if h == 7 {
                    switch w {
                        case 0: ltt = "A"; break;
                        case 1: ltt = "B"; break;
                        case 2: ltt = "C"; break;
                        case 3: ltt = "D"; break;
                        case 4: ltt = "E"; break;
                        case 5: ltt = "F"; break;
                        case 6: ltt = "G"; break;
                        case 7: ltt = "H"; break;
                    }
                    draw_text_transformed_colour(x - 4 * ca + w * ca + desf,
                        y + 24 + 8 * ca * 0.75, string_hash_to_newline(ltt), 0.7, 0.7, 0,
                        c_black, c_black, c_black, c_black, 0.8);
                }
            }
            if cmb == 0 {
                cmb = 1;
            }
            else {
                cmb = 0;
            }
            desf += ca * 0.2;
        }
    }
}

// casillas batalla
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
with o_batalla {
    if visible {
        var ca = o_control.celda_ajedrez;
        var desf = 0;
        var cmb = 0;
        var ltt;
        for (var h = 0; h < 8; h++) {
            for (var w = 0; w < 8; w++) {
                if cmb == 0 {
                    cmb = 3;
                }
                else {
                    cmb = 0;
                }
                draw_sprite(d_sombra, 10 + ds_grid_get(tiros, w, h) + cmb,
                    x - 4 * ca + w * ca + desf,
                    y + 24 + h * ca * 0.75);
                if w == 0 {
                    draw_text_transformed_colour(x - 4 * ca + -1 * ca + desf,
                        y + 24 + h * ca * 0.75, string_hash_to_newline(string(8 - h)), 0.7, 0.7, 0,
                        c_black, c_black, c_black, c_black, 0.8);
                }
                if h == 7 {
                    switch w {
                        case 0: ltt = "A"; break;
                        case 1: ltt = "B"; break;
                        case 2: ltt = "C"; break;
                        case 3: ltt = "D"; break;
                        case 4: ltt = "E"; break;
                        case 5: ltt = "F"; break;
                        case 6: ltt = "G"; break;
                        case 7: ltt = "H"; break;
                    }
                    draw_text_transformed_colour(x - 4 * ca + w * ca + desf,
                        y + 24 + 8 * ca * 0.75, string_hash_to_newline(ltt), 0.7, 0.7, 0,
                        c_black, c_black, c_black, c_black, 0.8);
                }
            }
            if cmb == 0 {
                cmb = 3;
            }
            else {
                cmb = 0;
            }
            desf += ca * 0.2;
        }
    }
}

// casillas juegovida
with o_gusano {
    if visible {
        draw_sprite(d_sombra, 5, x, y);
    }
}

// oscuridad dia y noche
if !m_editor {
    var h = o_reloj.hora + o_reloj.minuto * (1 / 60);
    if mipropio.objeto == 143 {
        h = 12;
    }
    var xx = __view_get( e__VW.XView, 0 ) - 50;
    var yy = __view_get( e__VW.YView, 0 ) - 50;
    var penumbra = surface_create(__view_get( e__VW.WView, 0 ) + 100, __view_get( e__VW.HView, 0 ) + 100);
    surface_set_target(penumbra);
    draw_clear_alpha(c_black, 1);
    var lamp = false;
    var lint = true;
    var alp;
    if h > 7 and h < 17 { // dia
        alp = 0;
        lint = false;
    }
    else if h > 19 or h < 5 { // noche
        alp = oscuridad;
        if h > 12 {
            lamp = true;
        }
    }
    else if h < 12 { // amanecer
        alp = lerp(oscuridad, 0, (h - 5) / 2);
    }
    else { // atardecer
        alp = lerp(0, oscuridad, (h - 17) / 2);
        lamp = true;
    }
    draw_set_blend_mode(bm_subtract);
    if lamp { // dibujar luces fijas del campus
        with o_luz {
            if visible {
                draw_sprite(d_luz, 0, x - xx, y - yy);
            }
        }
    }
    if lint { // dibujar linternas, por ejemplo objetos de usuarios
        with o_usuario {
            if visible {
                switch objeto {
                    case 107: // bombillo
                        draw_sprite(d_luz, 0, x - xx, y - yy); break;
                    case 108: // lampara
                        draw_sprite_ext(d_luz, 0, x - xx, y - yy, 1.5, 1.5, 0, c_white, 1); break;
                    case 110: // vela
                        draw_sprite_ext(d_luz, 0, x - xx, y - yy, 1, 1, 0, c_white, parpadeo_llama); break;
                    case 111: // antorcha
                        draw_sprite_ext(d_luz, 0, x - xx, y - yy, 0.5, 0.5, 0, c_white, parpadeo_llama); break;
                }
            }
            if objeto == 109 { // linterna
                if propietario {
                    draw_sprite(d_luz, 0, mouse_x - xx, mouse_y - yy);
                }
                else {
                    draw_sprite(d_luz, 0, puntero_x - xx, puntero_y - yy); break;
                }
            }
        }
        with o_tiro_humo {
            if visible {
                switch imagen {
                    case 25: case 26:
                        draw_sprite_ext(d_luz, 0, x - xx, y - yy, 0.5, 0.5, 0, c_white,
                            (reloj_fin / reloj_fin_max) * 0.5);
                        break;
                }
            }
        }
        with o_dispo {
            if visible {
                if tipo == 0 and salida == 1 {
                    draw_sprite(d_luz, 0, x - xx, y - yy);
                }
            }
        }
    }
    draw_set_blend_mode(bm_normal);
    surface_reset_target();
    draw_surface_ext(penumbra, xx, yy, 1, 1, 0, c_white, alp);
    surface_free(penumbra);
}
else {
    if herramienta == "luz" {
        draw_sprite_ext(d_luz, 0, mouse_x, mouse_y,
            1, 1, 0, c_white, 0.7);
        with o_luz {
            draw_sprite(d_luz, 0, x, y);
        }
    }
}

// lineas digital
draw_set_alpha(0.2);
with o_dispo {
    if visible {
        for (var i = 0; i < 3; i++) {
            if vecino[i] != noone {
                if instance_exists(vecino[i]) {
                    draw_line_width_colour(x, y, vecino[i].x, vecino[i].y,
                        2, c_red, c_white);
                }
            }
        }
    }
}
draw_set_alpha(1);

// lineas planetario
draw_set_alpha(0.2);
with o_planeta {
    if visible {
        draw_line_width_colour(x, y, centro.x, centro.y, 2, c_maroon, c_maroon);
    }
}
draw_set_alpha(1);

// lineas parabolico
with o_parabolico {
    if visible {
        draw_sprite_ext(d_sombra, 3, x, y, 1.5, 1.5, direction, c_red, 1);
    }
}

// sombra de puertas arco
if m_editor {
    if herramienta == "pared" {
        if seleccion == 1 or seleccion == 2 {
            draw_sprite(d_sombra, 4, mouse_x, mouse_y);
        }
    }
}
with o_decorado {
    if visible {
        if imagen == d_estructura and (subimagen == 1 or subimagen == 2) {
            draw_sprite(d_sombra, 4, x, y);
        }
    }
}

// sombra parti signal
with o_psig {
    if visible and activo {
        var v = 1 - clamp((x - orix) / o_control.signal_dist, 0, 1);
        draw_sprite_ext(d_sombra, 6, x, y, 1, 1, 0, c_white, v);
    }
}

// sombra parti signal
with o_pbatll {
    if visible and activo {
        draw_sprite_ext(d_sombra, 6, x, y, 1, 1, 0, c_white, 0.8);
    }
}

// sombra parti bala
with o_bala {
    if visible {
        draw_sprite(d_sombra, 6, x, y);
    }
}

// sombra parti digital
with o_chispa {
    if visible and activo {
        draw_sprite(d_sombra, 6, x, y);
    }
}

// sombra ahorcado
with o_ahorcado {
    if visible {
        if vidas < 6 {
            draw_sprite(d_sombra, 4, x + 16, y);
        }
    }
}

// sombra tiro parabolico
with o_tiro_pesado {
    if visible {
        var a = clamp(lerp(3, 0, (altura * 0.25) / 255), 0, 1);
        draw_sprite_ext(d_sombra, 0, x, y, 1, 1, 0, c_white, lerp(0.25, 1, a));
    }
}
with o_tiro_humo {
    if visible {
        var a = reloj_fin / reloj_fin_max;
        var e;
        switch imagen {
            case 26: case 27: e = lerp(3, 1, a) * 0.5; break;
            default: e = lerp(3, 1, a); break;
        }
        draw_sprite_ext(d_sombra, 0, x, y, e, e, 0, c_white, 0.5 * a);
    }
}

// sombra confeti
with o_confeti {
    if visible {
        var a = altura / altura_max;
        var e = lerp(2, 1, a) * 0.5;
        draw_sprite_ext(d_sombra, 0, x, y, e, e, 0, c_white, 0.5 * a);
    }
}

// sombra humo faso
with o_hierba {
    if visible {
        var a = reloj_fin / reloj_fin_max;
        var e = lerp(3, 1, a);
        draw_sprite_ext(d_sombra, 0, x, y, e, e, 0, c_white, 0.5 * a);
    }
}

// sombra globo
with o_globo {
    if visible {
        var a = 1 - altu / o_control.globo_altura;
        draw_sprite_ext(d_sombra, 9, x - 16, y, 1, 1, 0, c_white, a);
    }
}

// sombra tos
with o_tos {
    if visible {
        var a = reloj_fin / reloj_fin_max;
        draw_sprite_ext(d_sombra, 6, x, y, 1, 1, 0, c_white, 0.5 * a);
    }
}

// sombra gota
with o_gota {
    if visible and activo {
        var a = -power((clamp(altura, -100, 200) - 50) / 150, 2) + 1;
        draw_sprite_ext(d_sombra, 6, x, y, 1, 1, 0, c_white, 0.5 * a);
    }
}

// sombra particula
with o_particula {
    if visible and activo {
        var a = reloj_fin / reloj_fin_max;
        draw_sprite_ext(d_sombra, 6, x, y, 1, 1, 0, c_white, a);
    }
}

// sombra bicho y alimento
with o_bicho {
    if visible {
        draw_sprite(d_sombra, 9, x, y);
    }
}
with o_voladorcito {
    if visible {
        draw_sprite(d_sombra, 6, x, y);
    }
}

// sombra balon
with o_balon {
    if visible {
        draw_sprite(d_sombra, 4, x, y);
    }
}

// sombra criatura
with o_kreature {
    if visible {
        draw_sprite(d_sombra, 0, x, y);
    }
}

// sombra e indicadores usuarios
var mihashtag = mipropio.elhashtagmin;
with o_usuario {
    if visible {
        draw_sprite(d_sombra, 0, x, y);
        if enfermito {
            draw_sprite(d_sombra, 16, x, y);
        }
        else if salud == 1 {
            draw_sprite_ext(d_sombra, 16, x, y, 1, 1, 0, c_black, 1);
        }
        if propietario {
            draw_sprite(d_sombra, 1, x, y);
            if en_mira != noone {
                var ddd = point_direction(x, y, en_mira.x, en_mira.y);
                draw_sprite_ext(d_sombra, 3, x, y, 1, 1, ddd, c_white, 1);
            }
            if o_control.tutorial != 0 {
                var ddd;
                if o_control.tutorial == 2 { // registro
                    ddd = point_direction(x, y, o_registro.x, o_registro.y);
                }
                else { // ropero
                    var aux = instance_nearest(o_registro.x, o_registro.y, o_estilo);
                    ddd = point_direction(x, y, aux.x, aux.y);
                }
                draw_sprite_ext(d_sombra, 3, x, y, 2, 2, ddd, c_red, 1);
            }
        }
        else if mihashtag != "" and elhashtagmin == mihashtag {
            draw_sprite(d_sombra, 2, x, y);
        }
    }
    // puntero laser
    if objeto == 113 {
        if propietario {
            draw_sprite(d_luz, 1, mouse_x, mouse_y);
        }
        else {
            draw_sprite(d_luz, 1, puntero_x, puntero_y);
        }
    }
}


