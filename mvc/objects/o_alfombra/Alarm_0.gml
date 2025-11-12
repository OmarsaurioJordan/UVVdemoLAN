if s_ini_md5_open("alfombra" + string(idweb) + ".ini") {
    ini_open("alfombra" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    ds_grid_read(imagen, ini_read_string("dibujo", "imagen", ""));
    ds_grid_read(transp, ini_read_string("dibujo", "transp", ""));
    ini_close();
}


