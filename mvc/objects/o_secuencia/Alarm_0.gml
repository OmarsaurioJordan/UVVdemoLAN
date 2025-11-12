if s_ini_md5_open("secuencia" + string(idweb) + ".ini") {
    ini_open("secuencia" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    secuencia = ini_read_string("juego", "secuencia", "");
    intento = ini_read_string("juego", "intento", "");
    ultima = real(ini_read_string("juego", "ultima", "0"));
    repeticion = real(ini_read_string("juego", "repeticion", "0"));
    ini_close();
}


