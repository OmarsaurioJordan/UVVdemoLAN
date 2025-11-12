ini_open("ajedrez" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("juego", "tablero", ds_grid_write(tablero));
ini_write_string("juego", "turno", string(turno));
ini_write_string("juego", "turno_max", string(turno_max));
ini_close();
s_ini_md5_close("ajedrez" + string(idweb) + ".ini");


