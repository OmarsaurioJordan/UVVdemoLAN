/// @description  GUI

if !m_editor {
    
    // listado de contactos
    var dibumous = false;
    var xx = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - 96;
    var yy;
    for (var c = 0; c < total_contactos; c++) {
        if mipropio.amigo[c] != 0 {
            yy = __view_get( e__VW.YView, 0 ) + 32 * c;
            draw_sprite(d_perfil, 15, xx, yy);
            draw_sprite(d_perfil, 16 + mipropio.amigi[c], xx, yy);
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_text_transformed_colour(xx + 48, yy + 22,
                string_hash_to_newline(s_busca_nombre(mipropio.amigo[c])),
                0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
            if point_in_rectangle(mouse_x, mouse_y, xx, yy, xx + 96, yy + 32) {
                dibumous = true;
            }
        }
    }
    
    // perfil del propio usuario y ordenes contextuales
    with mipropio {
        s_draw_perfil(id, __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ));
        var xx = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 );
        var yy = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 );
        draw_set_halign(fa_right);
        draw_set_valign(fa_bottom);
        draw_set_alpha(0.6);
        var esc = 0.6;
        draw_rectangle_colour(xx - (string_width(string_hash_to_newline(comandos_gui)) * esc + 15),
            yy - (string_height(string_hash_to_newline(comandos_gui)) * esc + 15), xx - 5, yy - 5,
            c_white, c_white, c_white, c_white, false);
        draw_set_alpha(1);
        draw_text_transformed_colour(xx - 10, yy - 10, string_hash_to_newline(comandos_gui), esc, esc, 0,
            c_black, c_black, c_black, c_black, 1);
        break;
    }
    
    // puntero sobre contactos
    if dibumous {
        draw_sprite(d_puntero, 1, mouse_x, mouse_y);
    }
    
    // otro perfil abierto
    if mipropio.en_mira != noone {
        s_draw_perfil(mipropio.en_mira, __view_get( e__VW.XView, 0 ),
            __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) - 192);
    }
    
    // gran papel abierto para lectura grande
    if mipropio.papelote != "" {
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        var xx = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2;
        var yy = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2;
        draw_sprite_ext(d_papelote, 0, xx, yy, 1.5, 1.5, 0, c_white, 1);
        draw_text_ext_transformed_colour(xx, yy, string_hash_to_newline(mipropio.papelote),
            13, 232 * 1.5, 0.6, 0.6, 0 , c_black, c_black, c_black, c_black, 1);
    }
    // extension de pantallas
    else {
        var ptll = mipropio.pantalla;
        if ptll != noone { switch ptll.object_index {
            case o_lienzo:
                with ptll {
                    var xx = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2;
                    var yy = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2;
                    var e = 5;
                    var ww = ds_grid_width(imagen);
                    var hh = ds_grid_height(imagen);
                    for (var w = 0; w < ww; w++) {
                        for (var h = 0; h < hh; h++) {
                            draw_sprite_ext(d_piezas, 0,
                                xx + (lerp(-37, 37, w / ww) + 2) * e,
                                yy + (lerp(-37, 37, h / hh) + 2) * e,
                                e, e, 0, c_white, 1);
                        }
                    }
                    for (var w = 0; w < ww; w++) {
                        for (var h = 0; h < hh; h++) {
                            draw_sprite_ext(d_piezas, 0,
                                xx + (lerp(-37, 37, w / ww) + 2) * e,
                                yy + (lerp(-37, 37, h / hh) + 2) * e,
                                e, e, 0, ds_grid_get(imagen, w, h), ds_grid_get(transp, w, h));
                        }
                    }
                }
                break;
            
            case o_tablero:
                with ptll {
                    var xx = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2;
                    var yy = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2;
                    var e = 5;
                    var ww = ds_grid_width(imagen);
                    var hh = ds_grid_height(imagen);
                    for (var w = 0; w < ww; w++) {
                        for (var h = 0; h < hh; h++) {
                            draw_sprite_ext(d_piezas, 29,
                                xx + (lerp(-37, 37, w / ww) + 2) * e,
                                yy + (lerp(-37, 37, h / hh) + 2) * e,
                                e, e, 0, c_white, 1);
                        }
                    }
                    for (var w = 0; w < ww; w++) {
                        for (var h = 0; h < hh; h++) {
                            if ds_grid_get(imagen, w, h) != 0 {
                                draw_sprite_ext(d_piezas, 2,
                                    xx + (lerp(-37, 37, w / ww) + 2) * e,
                                    yy + (lerp(-37, 37, h / hh) + 2) * e,
                                    e, e, 0, c_white, 1);
                            }
                        }
                    }
                }
                break;
            
            case o_presentacion:
                with ptll {
                    if aguja != 255 {
                        var xx = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2;
                        var yy = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2;
                        var e = 5;
                        var ww = ds_grid_width(imagen);
                        var hh = ds_grid_height(imagen);
                        var ccc;
                        for (var w = 0; w < ww; w++) {
                            for (var h = 0; h < hh; h++) {
                                draw_sprite_ext(d_piezas, 0,
                                    xx + (lerp(-37, 37, w / ww) + 2) * e,
                                    yy + (lerp(-37, 37, h / hh) + 2) * e,
                                    e, e, 0, c_white, 1);
                            }
                        }
                        for (var w = 0; w < ww; w++) {
                            for (var h = 0; h < hh; h++) {
                                ccc = ds_grid_get(imagen, w, h);
                                if ccc != 0 {
                                    ccc = make_colour_rgb(ccc, ccc, ccc);
                                    draw_sprite_ext(d_piezas, 0,
                                        xx + (lerp(-37, 37, w / ww) + 2) * e,
                                        yy + (lerp(-37, 37, h / hh) + 2) * e,
                                        e, e, 0, ccc, 1);
                                }
                            }
                        }
                    }
                }
                break;
        } }
    }
    
    // pestanna para titulos de zonas y ref mapa
    var xx = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2;
    var yy = __view_get( e__VW.YView, 0 ) + 14;
    draw_sprite(d_zona, 0, xx, yy);
    // gran mapa abierto
    if mipropio.ver_mapa != noone {
        // dibujo mapa
        var esc = (__view_get( e__VW.WView, 0 ) * 0.8) / 1024;
        draw_sprite_ext(mipropio.ver_mapa, 0, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2,
            __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, esc, esc, 0, c_white, 0.8);
        // calculos de referencias y proporciones
        var ww = 1024 * esc;
        var hh = (1024 / room_width) * room_height * esc;
        var xo = (__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2) - (ww / 2);
        var yo = (__view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2) - (hh / 2);
        var invesc = room_width / ww;
        var zx = (mouse_x - xo) * invesc;
        var zy = (mouse_y - yo) * invesc;
        // dibujar a las criaturas
        with o_kreature {
            draw_sprite(d_piezas, 23, xo + x * (1 / invesc),
                yo + y * (1 / invesc));
        }
        // dibujar a todos los usuarios, mas translucidos si desconectados
        with o_usuario {
            if estaonline {
                draw_sprite(d_piezas, 15, xo + x * (1 / invesc),
                    yo + y * (1 / invesc));
            }
            else {
                draw_sprite_ext(d_piezas, 15, xo + x * (1 / invesc),
                    yo + y * (1 / invesc), 0.75, 0.75, 0, c_white, 0.75);
            }
        }
        // contactos del usuario actual
        var ami;
        for (var c = 0; c < total_contactos; c++) {
            if mipropio.amigo[c] != 0 {
                // buscar el id entre todos los usuarios, solo si el contacto no vacio
                ami = noone;
                with o_usuario {
                    if o_control.mipropio.amigo[c] == idweb {
                        ami = id;
                        break;
                    }
                }
                if ami != noone {
                    // dibujarlo dependiendo de si perfil en mira
                    if mipropio.en_mira == ami {
                        draw_sprite_ext(d_piezas, 4 + mipropio.amigi[c], xo + ami.x * (1 / invesc),
                            yo + ami.y * (1 / invesc), 1.5, 1.5, 0, c_white, 1);
                    }
                    else {
                        draw_sprite(d_piezas, 4 + mipropio.amigi[c], xo + ami.x * (1 / invesc),
                            yo + ami.y * (1 / invesc));
                    }
                }
            }
        }
        // usuario actual
        draw_sprite(d_piezas, 3, xo + mipropio.x * (1 / invesc),
            yo + mipropio.y * (1 / invesc));
        // titulos de zonas en mapa
        var zzz = instance_nearest(zx, zy, o_zona);
        if point_distance(zx, zy, zzz.x, zzz.y) <= radio_zona {
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_text_transformed_colour(xx, yy, string_hash_to_newline(s_titulo_zona(zzz.titulo)),
                0.8, 0.8, 0 , c_black, c_black, c_black, c_black, 1);
        }
        // puntero sobre mapa
        draw_sprite(d_puntero, 1, mouse_x, mouse_y);
    }
    // titulos de zonas sin influencia de mapa
    else {
        var zzz = instance_nearest(mipropio.x, mipropio.y, o_zona);
        if point_distance(mipropio.x, mipropio.y, zzz.x, zzz.y) <= radio_zona {
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_text_transformed_colour(xx, yy, string_hash_to_newline(s_titulo_zona(zzz.titulo)),
                0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
        }
    }
    
    // lapiz del tablero, por encima de todo como mouse
    if mipropio.cerca_esp != noone {
        if mipropio.cerca_esp.object_index == o_tablero {
            if mipropio.pantalla == mipropio.cerca_esp {
                draw_sprite(d_puntero, 0,
                    __view_get( e__VW.XView, 0 ) + lerp(127, 497, (mouse_x - __view_get( e__VW.XView, 0 )) / __view_get( e__VW.WView, 0 )),
                    __view_get( e__VW.YView, 0 ) + lerp(49, 417, (mouse_y - __view_get( e__VW.YView, 0 )) / __view_get( e__VW.HView, 0 )));
            }
            else {
                draw_sprite(d_puntero, 0, mouse_x, mouse_y);
            }
        }
    }
    
    // conteo respawn
    if mipropio.reloj_respawn != 0 {
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text_transformed_colour(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2,
            __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, string_hash_to_newline("Reaparecer en#" +
            string(round(mipropio.reloj_respawn)) + " s"),
            5, 5, 0, c_maroon, c_maroon, c_maroon, c_maroon, 1);
    }
}
else {
    switch herramienta {
        case "zona":
            draw_set_alpha(0.5);
            draw_rectangle_colour(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ),
                __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ), __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ),
                c_white, c_white, c_white, c_white, false);
            draw_set_alpha(1);
            draw_circle_colour(mouse_x, mouse_y, radio_zona, c_black, c_black, true);
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_text_transformed_colour(mouse_x, mouse_y, string_hash_to_newline(titulo_zona),
                1, 1, 0, c_black, c_black, c_black, c_black, 1);
            break;
        case "punto":
            draw_set_alpha(0.5);
            draw_rectangle_colour(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ),
                __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ), __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ),
                c_white, c_white, c_white, c_white, false);
            draw_set_alpha(1);
            draw_circle_colour(mouse_x, mouse_y, radio_zona, c_black, c_black, true);
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_text_transformed_colour(mouse_x, mouse_y, string_hash_to_newline(titulo_zona),
                1, 1, 0, c_black, c_black, c_black, c_black, 1);
            break;
    }
    
    draw_set_halign(fa_right);
    draw_set_valign(fa_bottom);
    draw_text_transformed_colour(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ),
        __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ), string_hash_to_newline(string(mouse_x) + "," + string(mouse_y)),
        1, 1, 0, c_black, c_black, c_black, c_black, 1);
}
// oscurecer para salir
if reloj_exit != 0 {
    draw_set_alpha(lerp(0.2, 0.6, reloj_exit));
    draw_rectangle_colour(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ),
        __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ), __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ),
        c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
}


