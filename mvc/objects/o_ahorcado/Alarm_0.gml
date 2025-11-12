if s_ini_md5_open("ahorcado" + string(idweb) + ".ini") {
    ini_open("ahorcado" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    palabra = ini_read_string("juego", "palabra", "");
    adivinada = ini_read_string("juego", "adivinada", "");
    vidas = real(ini_read_string("juego", "vidas", "6"));
    historial = ini_read_string("juego", "historial", "");
    ini_close();
}


