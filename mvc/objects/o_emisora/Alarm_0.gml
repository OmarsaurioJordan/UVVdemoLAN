if s_ini_md5_open("emisora" + string(idweb) + ".ini") {
    ini_open("emisora" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    texto = ini_read_string("texto", "texto", "");
    ini_close();
}


