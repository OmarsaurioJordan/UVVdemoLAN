ini_open("azar" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("azar", "ganador", string(ganador));
ini_write_string("azar", "numerito", numerito);
ini_write_string("azar", "dado", string(dado));
ini_close();
s_ini_md5_close("azar" + string(idweb) + ".ini");


