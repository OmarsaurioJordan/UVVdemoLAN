ini_open("acelerador" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
if activo {
    ini_write_string("simulador", "activo", "1");
}
else {
    ini_write_string("simulador", "activo", "0");
}
ini_write_string("simulador", "calor_ini", string(calor_ini));
ini_write_string("simulador", "cadencia", string(cadencia));
ini_write_string("simulador", "girar", string(girar));
ini_write_string("simulador", "direccional", string(direccional));
ini_write_string("simulador", "disparado", string(disparado));
ini_close();
s_ini_md5_close("acelerador" + string(idweb) + ".ini");


