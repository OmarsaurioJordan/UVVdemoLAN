ini_open("escritos" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
for (var i = 0; i < ds_list_size(textos); i++) {
    ini_write_string("textos", "t" + string(i), ds_list_find_value(textos, i));
}
ini_close();
s_ini_md5_close("escritos" + string(idweb) + ".ini");
ds_list_destroy(textos);


