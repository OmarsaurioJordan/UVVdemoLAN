if s_ini_md5_open("monumento" + string(idweb) + ".ini") {
    ini_open("monumento" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    imagenpng = ini_read_string("imagen", "imagen", "");
    mibandera = real(ini_read_string("imagen", "mibandera", "0"));
    s_actualiza_monumento(id);
    ini_close();
}


