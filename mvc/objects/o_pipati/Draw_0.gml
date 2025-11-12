draw_sprite(d_game, imge, x, y);

if jugador_a != 0 {
    if jugador_b == 0 {
        draw_sprite(d_cosas_game, 14, x, y);
    }
    else {
        draw_sprite(d_cosas_game, 7 + jugador_a, x, y);
    }
}
if jugador_b != 0 {
    if jugador_a == 0 {
        draw_sprite(d_cosas_game, 15, x, y);
    }
    else {
        draw_sprite(d_cosas_game, 10 + jugador_b, x, y);
    }
}


