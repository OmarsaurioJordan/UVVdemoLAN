ini_open("secuencia" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("juego", "secuencia", secuencia);
ini_write_string("juego", "intento", intento);
ini_write_string("juego", "ultima", string(ultima));
ini_write_string("juego", "repeticion", string(repeticion));
ini_close();
s_ini_md5_close("secuencia" + string(idweb) + ".ini");


