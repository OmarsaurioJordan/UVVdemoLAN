if s_ini_md5_open("parlante" + string(idweb) + ".ini") {
    ini_open("parlante" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    mute = real(ini_read_string("config", "mute", "0"));
    if ini_section_exists("audio") {
        var n = 0;
        ds_list_clear(archivo);
        while ini_key_exists("audio", "p" + string(n)) {
            ds_list_add(archivo, ini_read_string("audio", "p" + string(n), ""));
            n++;
        }
    }
    ini_close();
}
if directory_exists("ogg") {
    directory_destroy("ogg");
}


