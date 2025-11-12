ini_open("emisora" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("texto", "texto", texto);
ini_close();
s_ini_md5_close("emisora" + string(idweb) + ".ini");


