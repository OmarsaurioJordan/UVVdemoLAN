draw_sprite(d_core, imge, x, y);

var ww = ds_grid_width(imagen);
var hh = ds_grid_height(imagen);
for (var w = 0; w < ww; w++) {
    for (var h = 0; h < hh; h++) {
        if ds_grid_get(imagen, w, h) != 0 {
            draw_sprite(d_piezas, 2,
                x + lerp(-37, 37, w / ww) + 2,
                y + lerp(-84, -22, h / hh) + 2);
        }
    }
}

if o_control.mipropio.cerca_esp == id {
    draw_sprite(d_lapiz, 0,
        x + lerp(-37, 37, clamp(mouse_x - __view_get( e__VW.XView, 0 ),
            0, __view_get( e__VW.WView, 0 )) / __view_get( e__VW.WView, 0 )) + 2,
        y + lerp(-84, -22, clamp(mouse_y - __view_get( e__VW.YView, 0 ),
            0, __view_get( e__VW.HView, 0 )) / __view_get( e__VW.HView, 0 )) + 2);
}


