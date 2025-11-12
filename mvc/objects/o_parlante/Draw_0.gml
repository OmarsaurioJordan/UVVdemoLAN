draw_sprite(d_core, imge, x, y);

if s_parlante_okey(id) {
    draw_sprite(d_cosas_core, 22, x, y);
    if mute == 0 {
        draw_sprite(d_cosas_core, 23 + paso, x, y);
    }
}


