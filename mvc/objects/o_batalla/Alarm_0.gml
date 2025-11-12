if s_ini_md5_open("batalla" + string(idweb) + ".ini") {
    ini_open("batalla" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    ds_grid_read(barcos, ini_read_string("juego", "barcos", ""));
    ds_grid_read(tiros, ini_read_string("juego", "tiros", ""));
    ini_close();
    s_batalla_ficha();
}


