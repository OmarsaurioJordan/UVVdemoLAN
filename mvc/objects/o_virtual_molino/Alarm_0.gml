if s_ini_md5_open("molino.ini") {
    ini_open("molino.ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    ds_grid_read(opinador, ini_read_string("opinion", "opinador", ""));
    ini_close();
}


