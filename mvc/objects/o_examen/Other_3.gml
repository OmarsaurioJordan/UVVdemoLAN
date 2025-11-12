ini_open("examen" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("examen", "preguntas", ds_list_write(preguntas));
ini_write_string("examen", "estudiantes", ds_list_write(estudiantes));
ini_write_string("examen", "notas", ds_list_write(notas));
ini_close();
s_ini_md5_close("examen" + string(idweb) + ".ini");


