if s_ini_md5_open("signal" + string(idweb) + ".ini") {
    ini_open("signal" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    tipo = real(ini_read_string("signal", "tipo", "0"));
    amplitud = real(ini_read_string("signal", "amplitud", "5"));
    frecuencia = real(ini_read_string("signal", "frecuencia", "5"));
    desfase = real(ini_read_string("signal", "desfase", "5"));
    ini_close();
}


