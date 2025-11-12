draw_sprite(d_core, imge, x, y);
for (var i = 0; i < ds_list_size(textos); i++) {
    if ds_list_find_value(textos, i) != "" {
        draw_sprite(d_cosas_core, i + 1, x, y);
    }
}


