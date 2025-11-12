if s_ini_md5_open("escritos" + string(idweb) + ".ini") {
    ini_open("escritos" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    for (var i = 0; i < ds_list_size(textos); i++) {
        ds_list_replace(textos, i, ini_read_string("textos", "t" + string(i), ""));
    }
    ini_close();
}


