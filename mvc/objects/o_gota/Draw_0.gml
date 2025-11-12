if activo {
    var a = -power((clamp(altura, -100, 200) - 50) / 150, 2) + 1;
    draw_sprite_ext(d_piezas, 22, x, y - max(0, altura), 1, 1, 0, c_white, a);
}


