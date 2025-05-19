// arg0: id o_usuario del perfil
// arg1: posicion x
// arg2: posicion y

var xx = argument1;
var yy = argument2;
with argument0 {
    draw_sprite(d_perfil, 0, xx, yy);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);
    draw_sprite(d_perfil, 3 + zodiaco, xx, yy);
    draw_text_transformed_colour(xx + 66, yy + 63, string(current_year - edad),
        0.7, 0.7, 0, c_black, c_black, c_black, c_black, 1);
    draw_sprite(d_perfil, 1 + genero, xx, yy);
    draw_text_transformed_colour(xx + 49, yy + 83, o_control.title[nivel] + o_control.grupos[grupo],
        0.7, 0.7, 0, c_black, c_black, c_black, c_black, 1);
    draw_text_ext_transformed_colour(xx + 49, yy + 125, descripcion,
        13, 128, 0.6, 0.6, 0, c_black, c_black, c_black, c_black, 1);
    draw_text_transformed_colour(xx + 49, yy + 176, hashtag,
        0.7, 0.7, 0, c_black, c_black, c_black, c_black, 1);
    s_draw_cabeza(id, xx + 30, yy + 108);
    draw_text_transformed_colour(xx + 48, yy + 19, nombre,
        0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
}

