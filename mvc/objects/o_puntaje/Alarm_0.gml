if s_ini_md5_open("puntaje" + string(idweb) + ".ini") {
    ini_open("puntaje" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    puntos[0] = real(ini_read_string("juego", "p0", "0"));
    puntos[1] = real(ini_read_string("juego", "p1", "0"));
    reloj_juego = real(ini_read_string("juego", "reloj_juego", "0"));
    reloj_balon = real(ini_read_string("juego", "reloj_balon", "0"));
    enjuego = ini_read_string("juego", "enjuego", "0") != "0";
    var xx = real(ini_read_string("juego", "x", "0"));
    var yy = real(ini_read_string("juego", "y", "0"));
    if xx != 0 and yy != 0 {
        var aux = instance_create(xx, yy, o_balon);
        aux.origen = id;
    }
    ini_close();
}


