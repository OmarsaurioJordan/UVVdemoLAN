ini_open("batalla" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("juego", "barcos", ds_grid_write(barcos));
ini_write_string("juego", "tiros", ds_grid_write(tiros));
ini_close();
s_ini_md5_close("batalla" + string(idweb) + ".ini");


