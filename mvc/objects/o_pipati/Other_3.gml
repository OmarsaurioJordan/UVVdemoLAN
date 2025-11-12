ini_open("pipati" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("juego", "jugador_a", string(jugador_a));
ini_write_string("juego", "jugador_b", string(jugador_b));
ini_close();
s_ini_md5_close("pipati" + string(idweb) + ".ini");


