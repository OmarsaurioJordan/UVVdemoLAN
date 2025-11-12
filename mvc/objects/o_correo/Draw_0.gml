draw_sprite(d_core, imge, x, y);

if ds_list_find_index(o_virtual_correo.receptores, o_control.mipropio) != -1 {
    draw_sprite(d_cosas_core, 20, x, y);
}
else {
    draw_sprite(d_cosas_core, 21, x, y);
}


