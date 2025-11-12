if s_ini_md5_open("cultivo" + string(idweb) + ".ini") {
    ini_open("cultivo" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    ultima_accion = real(ini_read_string("config", "ultima_accion", "0"));
    var n = 0;
    var aux;
    while ini_section_exists("planta" + string(n)) {
        aux = instance_create(
            real(ini_read_string("planta" + string(n), "x", "0")),
            real(ini_read_string("planta" + string(n), "y", "0")),
            o_planta);
        aux.tipo = real(ini_read_string("planta" + string(n), "t", "0"));
        aux.vida = real(ini_read_string("planta" + string(n), "v", "0"));
        aux.fecha = real(ini_read_string("planta" + string(n), "f", "0"));
        aux.origen = id;
        n++;
    }
    ini_close();
}


