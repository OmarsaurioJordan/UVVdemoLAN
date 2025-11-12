if s_ini_md5_open("pipati" + string(idweb) + ".ini") {
    ini_open("pipati" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    jugador_a = real(ini_read_string("juego", "jugador_a", "0"));
    jugador_b = real(ini_read_string("juego", "jugador_b", "0"));
    ini_close();
}


