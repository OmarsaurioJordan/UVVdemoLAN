draw_sprite(d_game, imge, x, y);

draw_line_width_colour(x - 31, y - 24,
    x - 31 + lengthdir_x(16, angulo), y - 24 + lengthdir_y(16, angulo),
    2, c_red, c_red);
draw_line_width_colour(x + 23, y - 19,
    x + 23, y - (19 + 20 * (fuerza / 255)),
    2, c_red, c_red);


