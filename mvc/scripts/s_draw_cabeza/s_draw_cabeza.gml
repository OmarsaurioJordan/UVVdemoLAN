// arg0: id usuario
// arg1: posicion x
// arg2: posicion y

with argument0 {
    draw_sprite(d_avatar, piel * 6, argument1, argument2);
    if estaonline {
        draw_sprite(d_emocion, emocion, argument1, argument2);
    }
    else {
        draw_sprite(d_dormido, 0, argument1, argument2);
    }
    draw_sprite_ext(d_pelo, pelo, argument1, argument2,
        1, 1, 0, o_control.colores[tinte], 1);
}

