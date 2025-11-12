if s_ini_md5_open("nivel" + string(idweb) + ".ini") {
    ini_open("nivel" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    ds_grid_read(imagen, ini_read_string("dibujo", "imagen", ""));
    angulo = real(ini_read_string("dibujo", "angulo", "0"));
    ini_close();
}


