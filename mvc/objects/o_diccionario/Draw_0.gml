draw_sprite(d_core, imge, x, y);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_transformed_colour(x + 28, y - 27, string_hash_to_newline(string(aguja)),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x - 10, y - 75, string_hash_to_newline(ds_list_find_value(titulos, aguja)),
    0.7, 0.7, 0, c_black, c_black, c_black, c_black, 1);
var txt = ds_list_find_value(infos, aguja);
if txt != "" {
    draw_text_ext_transformed_colour(x - 10, y - 43, string_hash_to_newline(txt),
        13, 85, 0.6, 0.6, 0, c_black, c_black, c_black, c_black, 1);
}
else if !imagen_vacia {
    var ww = ds_grid_width(imagen);
    var hh = ds_grid_height(imagen);
    var ccc;
    for (var w = 0; w < ww; w++) {
        for (var h = 0; h < hh; h++) {
            ccc = ds_grid_get(imagen, w, h);
            if ccc != 0 {
                ccc = make_colour_rgb(ccc, ccc, ccc);
                draw_sprite_ext(d_piezas, 0,
                    x + lerp(-33, 12, w / ww) + 2,
                    y + lerp(-69, -15, h / hh) + 2,
                    1, 1, 0, ccc, 1);
            }
        }
    }
}


