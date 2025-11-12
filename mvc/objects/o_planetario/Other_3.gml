ini_open("planetario" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("planetas", "velocidad", string(velocidad));
ini_close();
s_ini_md5_close("planetario" + string(idweb) + ".ini");


