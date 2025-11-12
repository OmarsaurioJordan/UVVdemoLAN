ini_open("parabolico" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("tiro", "angulo", string(angulo));
ini_write_string("tiro", "direction", string(direction));
ini_write_string("tiro", "fuerza", string(fuerza));
ini_close();
s_ini_md5_close("parabolico" + string(idweb) + ".ini");


