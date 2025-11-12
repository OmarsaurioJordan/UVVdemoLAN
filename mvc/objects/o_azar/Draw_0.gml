draw_sprite(d_core, imge, x, y);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_transformed_colour(x + 22, y - 30, string_hash_to_newline(numerito),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x + 26, y - 62, string_hash_to_newline(string(dado)),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
if perfil_azar != noone {
    var srf = surface_create(96, 96);
    surface_set_target(srf);
    draw_clear_alpha(c_white, 0);
    draw_sprite(d_avatar, perfil_azar.piel * 6, 48, 96);
    if perfil_azar.estaonline {
        draw_sprite(d_emocion, perfil_azar.emocion, 48, 96);
    }
    else {
        draw_sprite(d_dormido, 0, 48, 96);
    }
    draw_sprite_ext(d_pelo, perfil_azar.pelo, 48, 96,
        1, 1, 0, o_control.colores[perfil_azar.tinte], 1);
    surface_reset_target();
    draw_surface_ext(srf, x - (24 + 48), y + 16 - 96, 1, 1, 0, c_white, 0.75);
    surface_free(srf);
}


