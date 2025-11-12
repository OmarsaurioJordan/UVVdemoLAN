/// @description  mouse y editor

if m_editor {
    with o_control {
        switch herramienta {
            case "pared":
                if puntox != 0 and puntoy != 0 {
                    draw_line_width_colour(puntox, puntoy, mouse_x, mouse_y,
                        2, c_red, c_blue)
                }
                if seleccion == 0 {
                    var srf = surface_create(96, 96);
                    surface_set_target(srf);
                    draw_clear_alpha(c_white, 0);
                    draw_sprite(d_estructura, 0, 48, 96);
                    if colorsito != -1 {
                        draw_sprite_ext(d_pintuco, 0, 48, 96,
                            1, 1, 0, o_control.colores[colorsito], 1);
                    }
                    surface_reset_target();
                    draw_surface_ext(srf, mouse_x - 48, mouse_y - 96,
                        1, 1, 0, c_white, 0.7);
                    surface_free(srf);
                }
                else {
                    draw_sprite_ext(d_estructura, seleccion, mouse_x, mouse_y,
                        1, 1, 0, c_white, 0.7);
                }
                break;
            case "arbol":
                draw_sprite_ext(d_arboles, seleccion, mouse_x, mouse_y,
                    1, 1, 0, c_white, 0.7);
                break;
            case "decorado":
                draw_sprite_ext(d_decorados, seleccion, mouse_x, mouse_y,
                    1, 1, 0, c_white, 0.7);
                break;
            case "baldoza":
                draw_sprite_ext(d_baldoza, seleccion, mouse_x, mouse_y,
                    1, 1, 0, o_control.colores[colorsito], 0.7);
                break;
            case "especial":
                draw_sprite_ext(d_core, seleccion, mouse_x, mouse_y,
                    1, 1, 0, c_white, 0.7);
                break;
            case "game":
                draw_sprite_ext(d_game, seleccion, mouse_x, mouse_y,
                    1, 1, 0, c_white, 0.7);
                break;
            case "luz":
                draw_sprite_ext(d_cosas_core, 31, mouse_x, mouse_y,
                    1, 1, 0, c_white, 0.7);
                break;
        }
    }
}
else {
    var cso = o_control.mipropio.cerca_esp;
    if cso != noone {
        if cso.object_index != o_tablero {
            cso = noone;
        }
    }
    if cso == noone {
        cso = o_control.mipropio;
        draw_sprite(d_mouse, 0, mouse_x, mouse_y);
        // dibujar distancia medicion
        if cso.objeto >= 73 and cso.objeto <= 75 {
            draw_set_valign(fa_bottom);
            draw_set_halign(fa_center);
            var ddd = point_distance(cso.x, cso.y, mouse_x, mouse_y);
            ddd = string(ddd / 48) + " m";
            draw_text_transformed_colour(mouse_x - 2, mouse_y - 64, string_hash_to_newline(ddd),
                0.6, 0.6, 0, c_white, c_white, c_white, c_white, 1);
            draw_text_transformed_colour(mouse_x + 2, mouse_y - 64, string_hash_to_newline(ddd),
                0.6, 0.6, 0, c_white, c_white, c_white, c_white, 1);
            draw_text_transformed_colour(mouse_x, mouse_y - 64, string_hash_to_newline(ddd),
                0.6, 0.6, 0, c_black, c_black, c_black, c_black, 1);
        }
    }
}


