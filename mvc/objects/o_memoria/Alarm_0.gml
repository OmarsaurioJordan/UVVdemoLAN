if s_ini_md5_open("memoria" + string(idweb) + ".ini") {
    ini_open("memoria" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    turno = real(ini_read_string("config", "turno", "0"));
    ultimo[0] = real(ini_read_string("config", "u0", "255"));
    ultimo[1] = real(ini_read_string("config", "u1", "0"));
    var aux;
    var tll = ds_grid_width(tablero);
    for (var h = 0; h < tll; h++) {
        for (var w = 0; w < tll; w++) {
            aux = ds_grid_get(tablero, w, h);
            aux.tipo = real(ini_read_string("tablero", "t" + string(w) + "_" + string(h), "0"));
            aux.mostrado = real(ini_read_string("tablero", "m" + string(w) + "_" + string(h), "0"));
        }
    }
    ini_close();
}


