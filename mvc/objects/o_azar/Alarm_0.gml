if s_ini_md5_open("azar" + string(idweb) + ".ini") {
    ini_open("azar" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    ganador = real(ini_read_string("azar", "ganador", "0"));
    numerito = ini_read_string("azar", "numerito", "000");
    dado = real(ini_read_string("azar", "dado", "0"));
    ini_close();
}


