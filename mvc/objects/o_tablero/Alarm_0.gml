if s_ini_md5_open("tablero" + string(idweb) + ".ini") {
    ini_open("tablero" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    ds_grid_read(imagen,
        ini_read_string("dibujo", "imagen", ""));
    ini_close();
}


