if s_ini_md5_open("acelerador" + string(idweb) + ".ini") {
    ini_open("acelerador" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    activo = ini_read_string("simulador", "activo", "1") != "0";
    calor_ini = real(ini_read_string("simulador", "calor_ini", "0"));
    cadencia = real(ini_read_string("simulador", "cadencia", "0"));
    girar = real(ini_read_string("simulador", "girar", "0"));
    direccional = real(ini_read_string("simulador", "direccional", "0"));
    disparado = real(ini_read_string("simulador", "disparado", "0"));
    ini_close();
}


