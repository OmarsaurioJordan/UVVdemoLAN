// arg0: str nombre de archivo donde guardar
// arg1: id de instancia usuario

with argument1 {
    var srf = surface_create(96, 104);
    surface_set_target(srf);
    draw_clear_alpha(c_white, 0);
    // dibujar al usuario
    var xx = 48;
    var yy = 104;
    var dsf = -4;
    if genero != 0 {
        dsf -= 4;
    }
    var raza = piel * 6;
    // pies
    draw_sprite(d_avatar, 3 + raza, xx, yy);
    draw_sprite(d_avatar, 4 + raza, xx, yy);
    // cuerpo
    draw_sprite(d_avatar, 1 + genero + raza, xx, yy + dsf);
    var rp = ropa;
    if genero == 0 {
        draw_sprite_ext(d_ropa_fem, rp, xx, yy + dsf, 1, 1, 0,
            o_control.colores[tela], 1);
    }
    else {
        if rp <= 1 {
            draw_sprite(d_avatar, 5 + raza, xx, yy + dsf);
        }
        draw_sprite_ext(d_ropa_masc, rp, xx, yy + dsf, 1, 1, 0,
            o_control.colores[tela], 1);
    }
    // cabeza
    draw_sprite(d_avatar, raza, xx, yy + dsf);
    draw_sprite(d_emocion, emocion, xx, yy + dsf);
    draw_sprite_ext(d_pelo, pelo, xx, yy + dsf, 1, 1, 0,
        o_control.colores[tinte], 1);
    // objeto
    draw_sprite(d_objeto, objeto, xx, yy + anima[0] + anima[2] + dsf);
    // expresion
    if expresion < 3 {
        draw_sprite(d_expresion, expresion, xx, yy + dsf);
    }
    else {
        draw_sprite(d_expresion, expresion + piel * 8, xx, yy + dsf);
    }
    // fin dibujado
    surface_reset_target();
    surface_save(srf, argument0);
    surface_free(srf);
}

