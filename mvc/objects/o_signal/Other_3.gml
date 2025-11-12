ini_open("signal" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("signal", "tipo", string(tipo));
ini_write_string("signal", "amplitud", string(amplitud));
ini_write_string("signal", "frecuencia", string(frecuencia));
ini_write_string("signal", "desfase", string(desfase));
ini_close();
s_ini_md5_close("signal" + string(idweb) + ".ini");


