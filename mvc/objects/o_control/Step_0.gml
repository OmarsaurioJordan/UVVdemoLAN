/// @description EDITOR

if m_editor {
    s_cam_zoom();
    s_cam_move(mouse_x, mouse_y, id);
    
    if keyboard_check_pressed(vk_escape) {
        if reloj_exit == 0 {
            reloj_exit = 1;
        }
        else {
            game_end();
            exit;
        }
    }
    else if keyboard_check_pressed(vk_enter) {
        s_save_mapa("_sav");
    }
    else if keyboard_check_pressed(ord("1")) {
        herramienta = "pared";
        seleccion = 0;
    }
    else if keyboard_check_pressed(ord("2")) {
        herramienta = "arbol";
        seleccion = 0;
    }
    else if keyboard_check_pressed(ord("3")) {
        herramienta = "decorado";
        seleccion = 0;
    }
    else if keyboard_check_pressed(ord("4")) {
        herramienta = "baldoza";
        seleccion = 0;
    }
    else if keyboard_check_pressed(ord("5")) {
        herramienta = "especial";
        seleccion = 0;
    }
    else if keyboard_check_pressed(ord("6")) {
        herramienta = "zona";
        seleccion = 0;
    }
    else if keyboard_check_pressed(ord("7")) {
        herramienta = "game";
        seleccion = 0;
    }
    else if keyboard_check_pressed(ord("8")) {
        herramienta = "luz";
        seleccion = 0;
    }
    else if keyboard_check_pressed(ord("9")) {
        herramienta = "punto";
        seleccion = 0;
    }
    else if keyboard_check_pressed(vk_f10) {
        var fff = get_save_filename("IMAGEN|*.png", "map");
        if fff != "" {
            screen_save(fff);
        }
    }
    
    switch herramienta {
        case "pared":
            if keyboard_check_pressed(vk_down) {
                seleccion--;
                if seleccion < 0 {
                    seleccion = sprite_get_number(d_estructura) - 1;
                }
            }
            else if keyboard_check_pressed(vk_up) {
                seleccion++;
                if seleccion >= sprite_get_number(d_estructura) {
                    seleccion = 0;
                }
            }
            if keyboard_check_pressed(vk_left) {
                colorsito--;
                if colorsito < -1 {
                    colorsito = array_length_1d(o_control.colores) - 1;
                }
            }
            else if keyboard_check_pressed(vk_right) {
                colorsito++;
                if colorsito >= array_length_1d(o_control.colores) {
                    colorsito = -1;
                }
            }
            if mouse_check_button_pressed(mb_left) {
                puntox = mouse_x;
                puntoy = mouse_y;
            }
            else if mouse_check_button_released(mb_left) {
                var xx, yy, aux;
                var borra = keyboard_check(vk_shift);
                var d = point_direction(puntox, puntoy, mouse_x, mouse_y);
                for (var i = 0; i <= point_distance(puntox, puntoy,
                        mouse_x, mouse_y); i++) {
                    xx = puntox + lengthdir_x(i, d);
                    yy = puntoy + lengthdir_y(i, d);
                    aux = instance_place(xx, yy, o_visible);
                    if aux != noone and borra {
                        with aux {
                            switch object_index {
                                case o_pared:
                                    instance_destroy();
                                    break;
                                case o_solido:
                                case o_decorado:
                                    if imagen == d_estructura {
                                        instance_destroy();
                                    }
                                    break;
                            }
                        }
                    }
                    else if aux == noone and !borra {
                        if seleccion == 0 {
                            aux = instance_create(xx, yy, o_pared);
                            aux.colorsito = colorsito;
                        }
                        else if seleccion == 1 or seleccion == 2 {
                            aux = instance_create(xx, yy, o_decorado);
                            aux.imagen = d_estructura;
                            aux.subimagen = seleccion;
                        }
                        else {
                            aux = instance_create(xx, yy, o_solido);
                            aux.imagen = d_estructura;
                            aux.subimagen = seleccion;
                        }
                    }
                }
                puntox = 0;
                puntoy = 0;
            }
            break;
        case "arbol":
            if keyboard_check_pressed(vk_down) {
                seleccion--;
                if seleccion < 0 {
                    seleccion = sprite_get_number(d_arboles) - 1;
                }
            }
            else if keyboard_check_pressed(vk_up) {
                seleccion++;
                if seleccion >= sprite_get_number(d_arboles) {
                    seleccion = 0;
                }
            }
            if keyboard_check(vk_shift) {
                if mouse_check_button(mb_left) {
                    var aux = instance_place(mouse_x, mouse_y, o_solido);
                    if aux != noone {
                        with aux {
                            if imagen == d_arboles {
                                instance_destroy();
                            }
                        }
                    }
                }
            }
            else if mouse_check_button_pressed(mb_left) {
                if !place_meeting(mouse_x, mouse_y, o_visible) {
                    var aux = instance_create(mouse_x, mouse_y, o_solido);
                    aux.imagen = d_arboles;
                    aux.subimagen = seleccion;
                }
            }
            break;
        case "decorado":
            if keyboard_check_pressed(vk_down) {
                seleccion--;
                if seleccion < 0 {
                    seleccion = sprite_get_number(d_decorados) - 1;
                }
            }
            else if keyboard_check_pressed(vk_up) {
                seleccion++;
                if seleccion >= sprite_get_number(d_decorados) {
                    seleccion = 0;
                }
            }
            if keyboard_check(vk_shift) {
                if mouse_check_button(mb_left) {
                    var aux = instance_place(mouse_x, mouse_y, o_decorado);
                    if aux != noone {
                        with aux {
                            if imagen == d_decorados {
                                instance_destroy();
                            }
                        }
                    }
                }
            }
            else if mouse_check_button_pressed(mb_left) {
                var aux = instance_place(mouse_x, mouse_y, o_visible);
                if aux != noone {
                    if point_distance(mouse_x, mouse_y, aux.x, aux.y) > 4 {
                        aux = instance_create(mouse_x, mouse_y, o_decorado);
                        aux.imagen = d_decorados;
                        aux.subimagen = seleccion;
                    }
                }
                else {
                    aux = instance_create(mouse_x, mouse_y, o_decorado);
                    aux.imagen = d_decorados;
                    aux.subimagen = seleccion;
                }
            }
            break;
        case "baldoza":
            if keyboard_check_pressed(vk_down) {
                seleccion--;
                if seleccion < 0 {
                    seleccion = sprite_get_number(d_baldoza) - 1;
                }
            }
            else if keyboard_check_pressed(vk_up) {
                seleccion++;
                if seleccion >= sprite_get_number(d_baldoza) {
                    seleccion = 0;
                }
            }
            if keyboard_check_pressed(vk_left) {
                colorsito--;
                if colorsito < 0 {
                    colorsito = array_length_1d(o_control.colores) - 1;
                }
            }
            else if keyboard_check_pressed(vk_right) {
                colorsito++;
                if colorsito >= array_length_1d(o_control.colores) {
                    colorsito = 0;
                }
            }
            if mouse_check_button(mb_left) {
                if keyboard_check(vk_shift) {
                    var aux = instance_place(mouse_x, mouse_y, o_baldoza);
                    if aux != noone {
                        with aux {
                            instance_destroy();
                        }
                    }
                }
                else {
                    if !place_meeting(mouse_x, mouse_y, o_baldoza) {
                        aux = instance_create(mouse_x, mouse_y, o_baldoza);
                        aux.colorsito = colorsito;
                        aux.subimagen = seleccion;
                    }
                }
            }
            break;
        case "especial":
            if keyboard_check_pressed(vk_down) {
                seleccion--;
                if seleccion < 0 {
                    seleccion = sprite_get_number(d_core) - 1;
                }
            }
            else if keyboard_check_pressed(vk_up) {
                seleccion++;
                if seleccion >= sprite_get_number(d_core) {
                    seleccion = 0;
                }
            }
            if keyboard_check(vk_shift) {
                if mouse_check_button(mb_left) {
                    var aux = instance_place(mouse_x, mouse_y, o_especial);
                    if aux != noone {
                        with aux {
                            instance_destroy();
                        }
                    }
                }
            }
            else if mouse_check_button_pressed(mb_left) {
                if !place_meeting(mouse_x, mouse_y, o_visible) {
                    switch seleccion {
                        case 0: instance_create(mouse_x, mouse_y, o_biblioteca); break;
                        case 1: instance_create(mouse_x, mouse_y, o_lienzo); break;
                        case 2: instance_create(mouse_x, mouse_y, o_presentacion); break;
                        case 3: instance_create(mouse_x, mouse_y, o_tablero); break;
                        case 4: instance_create(mouse_x, mouse_y, o_pergamino); break;
                        case 5: instance_create(mouse_x, mouse_y, o_parlante); break;
                        case 6: instance_create(mouse_x, mouse_y, o_piano); break;
                        case 7: instance_create(mouse_x, mouse_y, o_escritos); break;
                        case 8: instance_create(mouse_x, mouse_y, o_confesionario); break;
                        case 9: instance_create(mouse_x, mouse_y, o_diccionario); break;
                        case 10: instance_create(mouse_x, mouse_y, o_radio); break;
                        case 11: instance_create(mouse_x, mouse_y, o_emisora); break;
                        case 12: instance_create(mouse_x, mouse_y, o_correo); break;
                        case 13: instance_create(mouse_x, mouse_y, o_monumento); break;
                        case 14: instance_create(mouse_x, mouse_y, o_estilo); break;
                        case 15: instance_create(mouse_x, mouse_y, o_registro); break;
                        case 16: instance_create(mouse_x, mouse_y, o_baul); break;
                        case 17: instance_create(mouse_x, mouse_y, o_antena); break;
                        case 18: instance_create(mouse_x, mouse_y, o_mapa); break;
                        case 19: instance_create(mouse_x, mouse_y, o_nivel); break;
                        case 20: instance_create(mouse_x, mouse_y, o_reloj); break;
                        case 21: instance_create(mouse_x, mouse_y, o_examen); break;
                        case 22: instance_create(mouse_x, mouse_y, o_encuesta); break;
                        case 23: instance_create(mouse_x, mouse_y, o_votacion); break;
                        case 24: instance_create(mouse_x, mouse_y, o_molino); break;
                        case 25: instance_create(mouse_x, mouse_y, o_alfombra); break;
                        case 26: instance_create(mouse_x, mouse_y, o_azar); break;
                        case 27: instance_create(mouse_x, mouse_y, o_ciclas); break;
                    }
                }
            }
            break;
        case "zona":
            if mouse_check_button_pressed(mb_left) {
                if keyboard_check(vk_shift) {
                    var otr = instance_place(mouse_x, mouse_y, o_zona);
                    if otr != noone {
                        with otr {
                            instance_destroy();
                        }
                    }
                }
                else if !collision_circle(mouse_x, mouse_y, radio_zona / 2, o_zona, true, false) {
                    instance_create(mouse_x, mouse_y, o_zona);
                }
            }
            else if keyboard_check_pressed(vk_up) {
                titulo_zona = get_string("Título de la zona", titulo_zona);
            }
            break;
        case "punto":
            if mouse_check_button_pressed(mb_left) {
                if keyboard_check(vk_shift) {
                    var otr = instance_place(mouse_x, mouse_y, o_punto);
                    if otr != noone {
                        with otr {
                            instance_destroy();
                        }
                    }
                }
                else if !collision_circle(mouse_x, mouse_y, radio_zona / 2, o_punto, true, false) {
                    instance_create(mouse_x, mouse_y, o_punto);
                }
            }
            else if keyboard_check_pressed(vk_up) {
                titulo_zona = get_string("Título de la zona", titulo_zona);
            }
            break;
        case "game":
            if keyboard_check_pressed(vk_down) {
                seleccion--;
                if seleccion < 0 {
                    seleccion = sprite_get_number(d_game) - 1;
                }
            }
            else if keyboard_check_pressed(vk_up) {
                seleccion++;
                if seleccion >= sprite_get_number(d_game) {
                    seleccion = 0;
                }
            }
            if keyboard_check(vk_shift) {
                if mouse_check_button(mb_left) {
                    var aux = instance_place(mouse_x, mouse_y, o_game);
                    if aux != noone {
                        with aux {
                            instance_destroy();
                        }
                    }
                }
            }
            else if mouse_check_button_pressed(mb_left) {
                if !place_meeting(mouse_x, mouse_y, o_visible) {
                    switch seleccion {
                        case 0: instance_create(mouse_x, mouse_y, o_acelerador); break;
                        case 1: instance_create(mouse_x, mouse_y, o_puntaje); break;
                        case 2: instance_create(mouse_x, mouse_y, o_planetario); break;
                        case 3: instance_create(mouse_x, mouse_y, o_signal); break;
                        case 4: instance_create(mouse_x, mouse_y, o_cultivo); break;
                        case 5: instance_create(mouse_x, mouse_y, o_shooter); break;
                        case 6: instance_create(mouse_x, mouse_y, o_juegovida); break;
                        case 7: instance_create(mouse_x, mouse_y, o_ahorcado); break;
                        case 8: instance_create(mouse_x, mouse_y, o_tarot); break;
                        case 9: instance_create(mouse_x, mouse_y, o_evolutivo); break;
                        case 10: instance_create(mouse_x, mouse_y, o_calculadora); break;
                        case 11: instance_create(mouse_x, mouse_y, o_secuencia); break;
                        case 12: instance_create(mouse_x, mouse_y, o_pipati); break;
                        case 13: instance_create(mouse_x, mouse_y, o_digital); break;
                        case 14: instance_create(mouse_x, mouse_y, o_memoria); break;
                        case 15: instance_create(mouse_x, mouse_y, o_virus); break;
                        case 16: instance_create(mouse_x, mouse_y, o_parabolico); break;
                        case 17: instance_create(mouse_x, mouse_y, o_cancha); break;
                        case 18: instance_create(mouse_x, mouse_y, o_ajedrez); break;
                        case 19: instance_create(mouse_x, mouse_y, o_batalla); break;
                        case 20: instance_create(mouse_x, mouse_y, o_omwekiatl); break;
                        case 21: instance_create(mouse_x, mouse_y, o_univalle); break;
                        case 22: instance_create(mouse_x, mouse_y, o_gym); break;
                        case 23: instance_create(mouse_x, mouse_y, o_anatomia); break;
                        case 24: instance_create(mouse_x, mouse_y, o_sex); break;
                    }
                }
            }
            break;
        case "luz":
            if keyboard_check(vk_shift) {
                if mouse_check_button(mb_left) {
                    var aux = instance_place(mouse_x, mouse_y, o_luz);
                    if aux != noone {
                        with aux {
                            instance_destroy();
                        }
                    }
                }
            }
            else if mouse_check_button_pressed(mb_left) {
                if !place_meeting(mouse_x, mouse_y, o_visible) {
                    instance_create(mouse_x, mouse_y, o_luz);
                }
            }
            break;
    }
}


