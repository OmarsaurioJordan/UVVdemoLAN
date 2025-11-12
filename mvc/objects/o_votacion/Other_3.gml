ini_open("votacion" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("votos", "derecha", ds_list_write(derecha));
ini_write_string("votos", "izquierda", ds_list_write(izquierda));
ini_write_string("votos", "pregunta", pregunta);
ini_close();
s_ini_md5_close("votacion" + string(idweb) + ".ini");


