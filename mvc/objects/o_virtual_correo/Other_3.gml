ini_open("correo.ini");
ini_write_string("config", "fecha", string(fecha));
for (var i = 0; i < ds_list_size(mensajes); i++) {
    ini_write_string("mails", "m" + string(i), ds_list_find_value(mensajes, i));
    ini_write_string("mails", "e" + string(i), string(ds_list_find_value(emisores, i)));
    ini_write_string("mails", "r" + string(i), string(ds_list_find_value(receptores, i)));
    ini_write_string("mails", "f" + string(i), string(ds_list_find_value(fechas, i)));
}
ini_close();
s_ini_md5_close("correo.ini");


