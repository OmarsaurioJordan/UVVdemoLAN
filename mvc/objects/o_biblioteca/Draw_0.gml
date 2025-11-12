draw_sprite(d_core, imge, x, y);
for (var a = 0; a < ds_list_size(archivos); a++) {
    if !ds_list_empty(ds_list_find_value(archivos, a)) {
        draw_sprite(d_cosas_core, 11 + a, x, y);
    }
}


