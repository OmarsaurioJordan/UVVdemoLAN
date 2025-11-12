// imprimir lista de usuarios
// arg0: str texto extra a imprimir

with o_control {
    show_debug_message("List:");
    for (var i = 0; i < ds_list_size(conectados); i++) {
        show_debug_message("- " + ds_list_find_value(conectados, i) +
            " (" + string(ds_list_find_value(idconectados, i)) + ")");
    }
    show_debug_message("(" + argument0 + ")");
}

