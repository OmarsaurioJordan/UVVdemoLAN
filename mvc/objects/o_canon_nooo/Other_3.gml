ini_open("" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
// salvar datos
ini_close();
s_ini_md5_close("" + string(idweb) + ".ini");


