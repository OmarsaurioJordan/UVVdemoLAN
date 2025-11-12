ini_open("encuesta" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("encuesta", "preguntas", ds_list_write(preguntas));
ini_write_string("encuesta", "estudiantes", ds_list_write(estudiantes));
ini_write_string("encuesta", "respuestas", ds_list_write(respuestas));
ini_write_string("encuesta", "genero", string(genero));
ini_close();
s_ini_md5_close("encuesta" + string(idweb) + ".ini");


