draw_sprite(d_core, imge, x, y);

var tot = ds_list_size(melodia) - 1;
if tot >= 1 {
    for (var i = aguja + 1; i < min(aguja + 1 + 12, tot); i++) {
        var nt = ds_list_find_value(melodia, i);
        if nt != 0 {
            nt--;
            draw_sprite_ext(d_piezas, 1, x - 28 + (i - (aguja + 1)) * 4.58,
                y - 65 - lerp(0, 14, nt / 6),
                1, 1, 0, merge_colour(c_blue, c_red, nt / 6), 1);
        }
    }
}


