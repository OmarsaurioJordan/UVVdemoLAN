var v = ds_grid_get(origen.imagen, mx, my) / 255;
var p = round(lerp(0, 19, v));
draw_sprite_ext(d_nivel, p, x, y, 1, 0.5, 0,
    merge_colour(c_white, c_red, v), 0.7);


