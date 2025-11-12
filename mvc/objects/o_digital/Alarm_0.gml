if s_ini_md5_open("digital" + string(idweb) + ".ini") {
    ini_open("digital" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    mute = real(ini_read_string("config", "mute", "0"));
    var n = 0;
    var xx, yy, aux;
    var yop = id;
    with o_dispo {
        if origen == yop {
            instance_destroy();
        }
    }
    while ini_section_exists("dispo" + string(n)) {
        xx = real(ini_read_string("dispo" + string(n), "x", "0"));
        yy = real(ini_read_string("dispo" + string(n), "y", "0"));
        aux = instance_create(xx, yy, o_dispo);
        aux.name = real(ini_read_string("dispo" + string(n), "n", "255"));
        aux.tipo = real(ini_read_string("dispo" + string(n), "t", "0"));
        aux.valor = real(ini_read_string("dispo" + string(n), "v", "0"));
        for (var i = 0; i < 3; i++) {
            aux.vecina[i] = real(ini_read_string("dispo" + string(n),
                "c" + string(i), "255"));
        }
        aux.origen = id;
        n++;
    }
    ini_close();
}


