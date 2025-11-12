draw_sprite(d_core, imge, x, y);

if aguja != 255 {
    var ww = ds_grid_width(imagen);
    var hh = ds_grid_height(imagen);
    var ccc;
    for (var w = 0; w < ww; w++) {
        for (var h = 0; h < hh; h++) {
            ccc = ds_grid_get(imagen, w, h);
            if ccc != 0 {
                ccc = make_colour_rgb(ccc, ccc, ccc);
                draw_sprite_ext(d_piezas, 0,
                    x + lerp(-37, 37, w / ww) + 2,
                    y + lerp(-84, -22, h / hh) + 2,
                    1, 1, 0, ccc, 1);
            }
        }
    }
}


