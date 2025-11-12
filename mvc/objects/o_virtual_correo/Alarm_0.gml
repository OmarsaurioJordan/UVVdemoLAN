if s_ini_md5_open("correo.ini") {
    ini_open("correo.ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    ds_list_clear(mensajes);
    ds_list_clear(emisores);
    ds_list_clear(receptores);
    ds_list_clear(fechas);
    for (var i = 0; i < ds_list_size(mensajes); i++) {
        ds_list_add(mensajes, ini_read_string("mails", "m" + string(i), ""));
        ds_list_add(emisores, real(ini_read_string("mails", "e" + string(i), "0")));
        ds_list_add(receptores, real(ini_read_string("mails", "r" + string(i), "0")));
        ds_list_add(fechas, real(ini_read_string("mails", "f" + string(i), "0")));
    }
    ini_close();
}


