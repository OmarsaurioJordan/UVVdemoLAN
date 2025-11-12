ini_open("parlante" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("config", "mute", string(mute));
if ini_section_exists("audio") {
    ini_section_delete("audio");
}
if !ds_list_empty(archivo) {
    for (var i = 0; i < ds_list_size(archivo); i++) {
        ini_write_string("audio", "p" + string(i), ds_list_find_value(archivo, i));
    }
}
ini_close();
s_ini_md5_close("parlante" + string(idweb) + ".ini");
s_limpia_parlante(id, true);
ds_list_destroy(archivo);


