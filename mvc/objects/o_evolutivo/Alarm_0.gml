if s_ini_md5_open("evolutivo" + string(idweb) + ".ini") {
    ini_open("evolutivo" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    fuerza_mutacion = real(ini_read_string("evo", "fuerza_mutacion", "0"));
    fuerza_recombinacion = real(ini_read_string("evo", "fuerza_recombinacion", "0"));
    densidad_alimento = real(ini_read_string("evo", "densidad_alimento", "0"));
    num_bichos_udp = real(ini_read_string("evo", "num_bichos_udp", "0"));
    for (var g = 0; g < 6; g++) {
        gen[g] = real(ini_read_string("evo", "g" + string(g), "0"));
    }
    var aux;
    var n = 0;
    while ini_key_exists("bichos", "x" + string(n)) {
        aux = instance_create(real(ini_read_string("bichos", "x" + string(n), "0")),
            real(ini_read_string("bichos", "y" + string(n), "0")), o_bicho);
        aux.mx = real(ini_read_string("bichos", "mx" + string(n), "0"));
        aux.my = real(ini_read_string("bichos", "my" + string(n), "0"));
        for (var g = 0; g < 6; g++) {
            aux.gen[g] = real(ini_read_string("bichos", "g" + string(n) + "_" + string(g), "0"));
        }
        aux.energia = real(ini_read_string("bichos", "e" + string(n), "0"));
        aux.generacion = real(ini_read_string("bichos", "gt" + string(n), "1"));
        aux.edad = real(ini_read_string("bichos", "es" + string(n), "0"));
        aux.hijos = real(ini_read_string("bichos", "ht" + string(n), "0"));
        s_fenotipo(aux);
        n++;
    }
    with o_bicho {
        if mx != 0 or my != 0 {
            aux = id;
            with o_bicho {
                if id != aux and x == aux.mx and y == aux.my {
                    aux.madre = id;
                }
            }
        }
        mx = x; my = y;
    }
    n = 0;
    while ini_key_exists("alimento", "x" + string(n)) {
        aux = instance_create(real(ini_read_string("alimento", "x" + string(n), "0")),
            real(ini_read_string("alimento", "y" + string(n), "0")), o_alimento);
        aux.energia = real(ini_read_string("alimento", "e" + string(n), "0"));
        n++;
    }
    ini_close();
}


