if s_ini_md5_open("examen" + string(idweb) + ".ini") {
    ini_open("examen" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    ds_list_read(preguntas, ini_read_string("examen", "preguntas", ""));
    ds_list_read(estudiantes, ini_read_string("examen", "estudiantes", ""));
    ds_list_read(notas, ini_read_string("examen", "notas", ""));
    ini_close();
    s_notas(id);
}


