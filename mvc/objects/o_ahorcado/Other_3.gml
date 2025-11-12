ini_open("ahorcado" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("juego", "palabra", palabra);
ini_write_string("juego", "adivinada", adivinada);
ini_write_string("juego", "vidas", string(vidas));
ini_write_string("juego", "historial", historial);
ini_close();
s_ini_md5_close("ahorcado" + string(idweb) + ".ini");


