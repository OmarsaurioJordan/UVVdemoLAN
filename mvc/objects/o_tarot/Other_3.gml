ini_open("tarot" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
for (var i = 0; i < 3; i++) {
    ini_write_string("baraja", "c" + string(i), string(carta[i]));
}
ini_close();
s_ini_md5_close("tarot" + string(idweb) + ".ini");


