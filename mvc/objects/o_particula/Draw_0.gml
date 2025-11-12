if activo {
    var a = reloj_fin / reloj_fin_max;
    var c = merge_colour(merge_colour(c_blue, c_red, calor), c_white, 0.2);
    draw_sprite_ext(d_piezas, 19, x, y - (z + anima[0]), 1, 1, image_angle, c, a);
}


