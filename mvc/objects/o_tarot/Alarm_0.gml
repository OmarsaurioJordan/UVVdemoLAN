if s_ini_md5_open("tarot" + string(idweb) + ".ini") {
    ini_open("tarot" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    for (var i = 0; i < 3; i++) {
        carta[i] = real(ini_read_string("baraja", "c" + string(i), "0"));
    }
    ini_close();
}


