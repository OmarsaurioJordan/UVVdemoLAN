if s_ini_md5_open("juegovida" + string(idweb) + ".ini") {
    ini_open("juegovida" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    ds_grid_read(est_nex, ini_read_string("juego", "est_nex", ""));
    ds_grid_read(entrante, ini_read_string("juego", "entrante", ""));
    reloj_max = real(ini_read_string("juego", "reloj_max", "1"));
    regla[0] = ini_read_string("juego", "r0", "23");
    regla[1] = ini_read_string("juego", "r1", "3");
    ini_close();
}


