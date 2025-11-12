ini_open("juegovida" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("juego", "est_nex", ds_grid_write(est_nex));
ini_write_string("juego", "entrante", ds_grid_write(entrante));
ini_write_string("juego", "reloj_max", string(reloj_max));
ini_write_string("juego", "r0", regla[0]);
ini_write_string("juego", "r1", regla[1]);
ini_close();
s_ini_md5_close("juegovida" + string(idweb) + ".ini");


