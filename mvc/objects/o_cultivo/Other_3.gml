if file_exists("cultivo" + string(idweb) + ".ini") {
    file_delete("cultivo" + string(idweb) + ".ini");
}
ini_open("cultivo" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("config", "ultima_accion", string(ultima_accion));
var yop = id;
var n = 0;
with o_planta {
    if origen == yop {
        ini_write_string("planta" + string(n), "x", string(x));
        ini_write_string("planta" + string(n), "y", string(y));
        ini_write_string("planta" + string(n), "t", string(tipo));
        ini_write_string("planta" + string(n), "v", string(vida));
        ini_write_string("planta" + string(n), "f", string(fecha));
        n++;
    }
}
ini_close();
s_ini_md5_close("cultivo" + string(idweb) + ".ini");


