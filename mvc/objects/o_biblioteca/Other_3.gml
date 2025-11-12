ini_open("biblioteca" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
var aux, sec;
for (var a = 0; a < ds_list_size(archivos); a++) {
    sec = "archivo" + string(a);
    if ini_section_exists(sec) {
        ini_section_delete(sec);
    }
    ini_write_string(sec, "fecha", string(fechas[a]));
    aux = ds_list_find_value(archivos, a);
    if !ds_list_empty(aux) {
        for (var i = 0; i < ds_list_size(aux); i++) {
            ini_write_string(sec, "p" + string(i), ds_list_find_value(aux, i));
        }
    }
}
ini_close();
s_ini_md5_close("biblioteca" + string(idweb) + ".ini");
for (var a = 0; a < ds_list_size(archivos); a++) {
    ds_list_destroy(ds_list_find_value(archivos, a));
}
ds_list_destroy(archivos);


