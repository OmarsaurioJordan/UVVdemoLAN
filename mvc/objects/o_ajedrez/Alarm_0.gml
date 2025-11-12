if s_ini_md5_open("ajedrez" + string(idweb) + ".ini") {
    ini_open("ajedrez" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    ds_grid_read(tablero, ini_read_string("juego", "tablero", ""));
    turno = real(ini_read_string("juego", "turno", "0"));
    turno_max = real(ini_read_string("juego", "turno_max", "0"));
    ini_close();
    s_ajedrez_fichas(id);
}


