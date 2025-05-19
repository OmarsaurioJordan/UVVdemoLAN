// arg0: str nombre de archivo con extension
// arg1: talla width de resultado

var esc = argument1 / room_width
var srf = surface_create(argument1, esc * room_height);
surface_set_target(srf);
// poner fondo background
for (var w = 0; w < room_width; w += 64) {
    for (var h = 0; h < room_height; h += 64) {
        draw_background(d_suelo, w, h);
    }
}
// poner baldozas
if is_array(o_control.baldozall) {
    with o_control {
        for (var i = 0; i < array_height_2d(baldozall); i++) {
            draw_sprite_ext(d_baldoza, baldozall[i, 2],
                baldozall[i, 0] * esc, baldozall[i, 1] * esc,
                esc, esc, 0, colores[baldozall[i, 3]], 0.5);
        }
    }
}
else {
    with o_baldoza {
        draw_sprite_ext(d_baldoza, subimagen, x * esc, y * esc,
            esc, esc, 0, o_control.colores[colorsito], 0.8);
    }
}
// poner celdas ajedrez
with o_ajedrez {
    var ca = o_control.celda_ajedrez * esc;
    var desf = 0;
    var cmb = 0;
    for (var h = 0; h < 8; h++) {
        for (var w = 0; w < 8; w++) {
            if cmb == 0 {
                cmb = 1;
            }
            else {
                cmb = 0;
            }
            draw_sprite_ext(d_sombra, 7 + cmb,
                x * esc - 4 * ca + w * ca + desf,
                y * esc + 24 * esc + h * ca * 0.75,
                esc, esc, 0, c_white, 1);
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
// poner celdas batalla
with o_batalla {
    var ca = o_control.celda_ajedrez * esc;
    var desf = 0;
    var cmb = 0;
    for (var h = 0; h < 8; h++) {
        for (var w = 0; w < 8; w++) {
            if cmb == 0 {
                cmb = 3;
            }
            else {
                cmb = 0;
            }
            draw_sprite(d_sombra, 10 + cmb,
                x * esc - 4 * ca + w * ca + desf,
                y * esc + 24 * esc + h * ca * 0.75);
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
// poner celdas juegovida
with o_gusano {
    draw_sprite_ext(d_sombra, 5, x * esc, y * esc, esc, esc, 0, c_white, 1);
}
// poner objetos varios segun depth
var list = ds_priority_create();
var aux;
with o_solido {
    ds_priority_add(list, id, depth);
}
with o_pared {
    ds_priority_add(list, id, depth);
}
with o_decorado {
    ds_priority_add(list, id, depth);
}
with o_especial {
    ds_priority_add(list, id, depth);
}
with o_game {
    ds_priority_add(list, id, depth);
}
with o_luz {
    ds_priority_add(list, id, depth);
}
with o_fichamem {
    ds_priority_add(list, id, depth);
}
with o_planeta {
    ds_priority_add(list, id, depth);
}
while !ds_priority_empty(list) {
    aux = ds_priority_delete_max(list);
    with aux {
        switch object_index {
            case o_solido:
                draw_sprite_ext(imagen, subimagen, x * esc, y * esc, esc, esc, 0, c_white, 1);
                break;
            case o_pared:
                draw_sprite_ext(d_estructura, 0, x * esc, y * esc, esc, esc, 0, c_white, 1);
                if colorsito != -1 {
                    draw_sprite_ext(d_pintuco, 0, x * esc, y * esc,
                        esc, esc, 0, o_control.colores[colorsito], 1);
                }
                break;
            case o_decorado:
                draw_sprite_ext(imagen, subimagen, x * esc, y * esc, esc, esc, 0, c_white, 1);
                break;
            case o_luz:
                draw_sprite_ext(d_cosas_core, 31, x * esc, y * esc, esc, esc, 0, c_white, 1);
                break;
            case o_fichamem:
                draw_sprite_ext(d_ajedrez, 18, x * esc, y * esc, esc, esc, 0, c_white, 1);
                break;
            case o_planeta:
                draw_sprite_ext(d_cosas_game, 16 + tipo, x * esc, y * esc, esc, esc, 0, c_white, 1);
                break;
            default:
                if object_get_parent(object_index) == o_especial {
                    draw_sprite_ext(d_core, imge, x * esc, y * esc, esc, esc, 0, c_white, 1);
                }
                else if object_get_parent(object_index) == o_game {
                    draw_sprite_ext(d_game, imge, x * esc, y * esc, esc, esc, 0, c_white, 1);
                }
                break;
        }
    }
}
ds_priority_destroy(list);
// quitar transparencia
var srff = surface_create(argument1, esc * room_height);
surface_set_target(srff);
draw_clear_alpha(c_white, 1);
draw_surface(srf, 0, 0);
// finalizar
surface_reset_target();
surface_save(srff, argument0);
surface_free(srff);
surface_free(srf);

