if s_ini_md5_open("encuesta" + string(idweb) + ".ini") {
    ini_open("encuesta" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    ds_list_read(preguntas, ini_read_string("encuesta", "preguntas", ""));
    ds_list_read(estudiantes, ini_read_string("encuesta", "estudiantes", ""));
    ds_list_read(respuestas, ini_read_string("encuesta", "respuestas", ""));
    genero = real(ini_read_string("encuesta", "genero", "0"));
    ini_close();
    s_respuestas(id);
}


