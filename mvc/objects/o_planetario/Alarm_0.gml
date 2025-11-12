if s_ini_md5_open("planetario" + string(idweb) + ".ini") {
    ini_open("planetario" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    velocidad = real(ini_read_string("planetas", "velocidad", "1"));
    ini_close();
}


