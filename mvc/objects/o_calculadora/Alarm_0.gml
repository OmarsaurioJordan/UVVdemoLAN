if s_ini_md5_open("calculadora" + string(idweb) + ".ini") {
    ini_open("calculadora" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    pregunta = ini_read_string("pregunta", "pregunta", "");
    for (var i = 0; i < 4; i++) {
        respuesta[i] = ini_read_string("pregunta", "r" + string(i), "");
    }
    verdadera = real(ini_read_string("pregunta", "verdadera", "0"));
    nivel = real(ini_read_string("pregunta", "nivel", "0"));
    puntos[0] = real(ini_read_string("pregunta", "p0", "0"));
    puntos[1] = real(ini_read_string("pregunta", "p1", "0"));
    ini_close();
}


