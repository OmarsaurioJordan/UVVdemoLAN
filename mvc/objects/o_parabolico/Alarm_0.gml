if s_ini_md5_open("parabolico" + string(idweb) + ".ini") {
    ini_open("parabolico" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    angulo = real(ini_read_string("tiro", "angulo", "0"));
    direction = real(ini_read_string("tiro", "direction", "0"));
    fuerza = real(ini_read_string("tiro", "fuerza", "0"));
    ini_close();
}


