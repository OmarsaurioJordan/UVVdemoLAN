if s_ini_md5_open("anatomia" + string(idweb) + ".ini") {
    ini_open("anatomia" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    intensidad = real(ini_read_string("intensidad", "intensidad", "0"));
    ini_close();
}


