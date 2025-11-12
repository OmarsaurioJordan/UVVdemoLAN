if s_ini_md5_open("diccionario" + string(idweb) + ".ini") {
    ini_open("diccionario" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    aguja = real(ini_read_string("config", "aguja", "0"));
    for (var i = 0; i < ds_list_size(titulos); i++) {
        ds_list_replace(titulos, i, ini_read_string("contenido", "t" + string(i), ""));
        ds_list_replace(fotos, i, ini_read_string("contenido", "f" + string(i), ""));
        ds_list_replace(infos, i, ini_read_string("contenido", "i" + string(i), ""));
    }
    ini_close();
    s_diccionario_aguja(id);
}


