if s_ini_md5_open("presentacion" + string(idweb) + ".ini") {
    ini_open("presentacion" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    aguja = real(ini_read_string("config", "aguja", "0"));
    var n = 0;
    ds_list_clear(fotos);
    while ini_key_exists("contenido", "f" + string(n)) {
        ds_list_add(fotos, ini_read_string("contenido", "f" + string(n), ""));
        n++;
    }
    ini_close();
    s_presentacion_aguja(id);
}


