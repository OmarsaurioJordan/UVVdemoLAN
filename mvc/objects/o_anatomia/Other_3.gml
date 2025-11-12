ini_open("anatomia" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("intensidad", "intensidad", string(intensidad));
ini_close();
s_ini_md5_close("anatomia" + string(idweb) + ".ini");


