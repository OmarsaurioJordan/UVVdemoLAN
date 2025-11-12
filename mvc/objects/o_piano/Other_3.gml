ini_open("piano" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("config", "mute", string(mute));
if !ds_list_empty(melodia) {
    ini_write_string("melodia", "notas", ds_list_write(melodia));
}
else {
    ini_write_string("melodia", "notas", "");
}
ini_close();
s_ini_md5_close("piano" + string(idweb) + ".ini");


