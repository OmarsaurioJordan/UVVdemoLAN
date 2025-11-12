if s_ini_md5_open("votacion" + string(idweb) + ".ini") {
    ini_open("votacion" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    ds_list_read(derecha, ini_read_string("votos", "derecha", ""));
    ds_list_read(izquierda, ini_read_string("votos", "izquierda", ""));
    pregunta = ini_read_string("votos", "pregunta", "");
    ini_close();
}


