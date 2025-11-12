if s_ini_md5_open("" + string(idweb) + ".ini") {
    ini_open("" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    // cargar datos
    ini_close();
}


