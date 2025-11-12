if s_ini_md5_open("pergamino" + string(idweb) + ".ini") {
    ini_open("pergamino" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    texto = ini_read_string("texto", "texto", "");
    textote = ini_read_string("texto", "textote", "");
    ini_close();
}


