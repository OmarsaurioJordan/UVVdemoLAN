if cercano_A == noone {
    draw_sprite(d_game, imge, x, y);
}
else {
    var a = cercano_A;
    var b = cercano_B;
    if b.genero == 1 and a.genero == 0 {
        a = cercano_B;
        b = cercano_A;
    }
    draw_sprite(d_cosas_game, 39 + paso, x, y);
    s_draw_cabeza(a, x - 13 + anima[0] * 0.69, y - 5 + anima[0]);
    s_draw_cabeza(b, x + 15 + anima[0], y + 11 - anima[0] * 0.69);
    draw_sprite(d_cosas_game, 36 + paso, x, y);
}


