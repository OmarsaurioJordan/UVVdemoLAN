if s_ini_md5_open("virus" + string(idweb) + ".ini") {
    ini_open("virus" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    mortandad = real(ini_read_string("virus", "mortandad", "0"));
    incubacion = real(ini_read_string("virus", "incubacion", "0"));
    enfermedad = real(ini_read_string("virus", "enfermedad", "0"));
    transmision = real(ini_read_string("virus", "transmision", "0"));
    curatodos = real(ini_read_string("virus", "curatodos", "0"));
    ini_close();
}


