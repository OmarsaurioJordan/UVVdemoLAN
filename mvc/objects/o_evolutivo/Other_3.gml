ini_open("evolutivo" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("evo", "fuerza_mutacion", string(fuerza_mutacion));
ini_write_string("evo", "fuerza_recombinacion", string(fuerza_recombinacion));
ini_write_string("evo", "densidad_alimento", string(densidad_alimento));
ini_write_string("evo", "num_bichos_udp", string(num_bichos_udp));
for (var g = 0; g < 6; g++) {
    ini_write_string("evo", "g" + string(g), string(gen[g]));
}
if ini_section_exists("bichos") {
    ini_section_delete("bichos");
}
var n = 0;
with o_bicho {
    ini_write_string("bichos", "x" + string(n), string(x));
    ini_write_string("bichos", "y" + string(n), string(y));
    if madre != noone {
        if instance_exists(madre) {
            ini_write_string("bichos", "mx" + string(n), string(madre.x));
            ini_write_string("bichos", "my" + string(n), string(madre.y));
        }
        else {
            ini_write_string("bichos", "mx" + string(n), "0");
            ini_write_string("bichos", "my" + string(n), "0");
        }
    }
    else {
        ini_write_string("bichos", "mx" + string(n), "0");
        ini_write_string("bichos", "my" + string(n), "0");
    }
    for (var g = 0; g < 6; g++) {
        ini_write_string("bichos", "g" + string(n) + "_" + string(g), string(gen[g]));
    }
    ini_write_string("bichos", "e" + string(n), string(energia));
    ini_write_string("bichos", "gt" + string(n), string(generacion));
    ini_write_string("bichos", "es" + string(n), string(edad));
    ini_write_string("bichos", "ht" + string(n), string(hijos));
    n++;
}
if ini_section_exists("alimento") {
    ini_section_delete("alimento");
}
n = 0;
with o_alimento {
    ini_write_string("alimento", "x" + string(n), string(x));
    ini_write_string("alimento", "y" + string(n), string(y));
    ini_write_string("alimento", "e" + string(n), string(energia));
    n++;
}
ini_close();
s_ini_md5_close("evolutivo" + string(idweb) + ".ini");


