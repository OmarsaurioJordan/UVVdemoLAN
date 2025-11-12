ini_open("calculadora" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("pregunta", "pregunta", pregunta);
for (var i = 0; i < 4; i++) {
    ini_write_string("pregunta", "r" + string(i), respuesta[i]);
}
ini_write_string("pregunta", "verdadera", string(verdadera));
ini_write_string("pregunta", "nivel", string(nivel));
ini_write_string("pregunta", "p0", string(puntos[0]));
ini_write_string("pregunta", "p1", string(puntos[1]));
ini_close();
s_ini_md5_close("calculadora" + string(idweb) + ".ini");


