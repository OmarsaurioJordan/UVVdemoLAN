// arg0: id objeto que se solapa con otro igual

with argument0 {
    if collision_point(x, y, object_index, true, true) {
        ds_list_add(o_control.lista_borra_repetidos, id);
    }
}

