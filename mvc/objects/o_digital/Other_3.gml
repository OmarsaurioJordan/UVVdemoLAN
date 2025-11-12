if file_exists("digital" + string(idweb) + ".ini") {
    file_delete("digital" + string(idweb) + ".ini");
}
ini_open("digital" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("config", "mute", string(mute));
var n = 0;
var yop = id;
with o_dispo {
    if origen == yop {
        ini_write_string("dispo" + string(n), "x", string(x));
        ini_write_string("dispo" + string(n), "y", string(y));
        ini_write_string("dispo" + string(n), "n", string(name));
        ini_write_string("dispo" + string(n), "t", string(tipo));
        ini_write_string("dispo" + string(n), "v", string(valor));
        for (var i = 0; i < 3; i++) {
            ini_write_string("dispo" + string(n), "c" + string(i), string(vecina[i]));
        }
        n++;
    }
}
ini_close();
s_ini_md5_close("digital" + string(idweb) + ".ini");


