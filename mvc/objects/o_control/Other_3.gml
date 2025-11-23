if conexion >= 0 {
    network_destroy(conexion);
    buffer_delete(saludo_buf);
    ds_stack_destroy(broadcast);
    ds_list_destroy(conectados);
    ds_list_destroy(tiempomuerto);
    ds_list_destroy(idconectados);
    ds_priority_destroy(prioridad);
    sprite_delete(dd_mapa);
    ds_list_destroy(ahorcado_palabras);
    s_ini_save("mascaraLAN", mascara);
    s_ini_save("mascaraMSK", enmascara);
    s_save_mapa("");
}


