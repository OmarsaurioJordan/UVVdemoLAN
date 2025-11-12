if esconfeti {
    draw_sprite(d_objeto, 174, x, y - (altu + 1));
}
else {
    var a = 1 - altu / o_control.globo_altura;
    draw_sprite_ext(d_objeto, 102, x, y - (altu + 1),
        1, 1, 0, c_white, a);
}


