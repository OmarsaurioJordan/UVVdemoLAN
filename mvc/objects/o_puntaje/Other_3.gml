ini_open("puntaje" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("juego", "p0", string(puntos[0]));
ini_write_string("juego", "p1", string(puntos[1]));
ini_write_string("juego", "reloj_juego", string(reloj_juego));
ini_write_string("juego", "reloj_balon", string(reloj_balon));
if enjuego {
    ini_write_string("juego", "enjuego", "1");
}
else {
    ini_write_string("juego", "enjuego", "0");
}
var bll = noone;
var yop = id;
with o_balon {
    if origen == yop {
        bll = id;
        break;
    }
}
if bll != noone {
    ini_write_string("juego", "x", string(bll.posx));
    ini_write_string("juego", "y", string(bll.posy));
}
else {
    ini_write_string("juego", "x", "0");
    ini_write_string("juego", "y", "0");
}
ini_close();
s_ini_md5_close("puntaje" + string(idweb) + ".ini");


