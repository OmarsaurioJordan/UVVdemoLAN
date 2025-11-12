if mostrado == 0 {
    if exalte {
        draw_sprite(d_ajedrez, 19, x, y);
    }
    else {
        draw_sprite(d_ajedrez, 18, x, y);
    }
}
else {
    draw_sprite(d_fichamem, tipo, x, y);
}


