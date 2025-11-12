ini_open("diccionario" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("config", "aguja", string(aguja));
for (var i = 0; i < ds_list_size(titulos); i++) {
    ini_write_string("contenido", "t" + string(i), ds_list_find_value(titulos, i));
    ini_write_string("contenido", "f" + string(i), ds_list_find_value(fotos, i));
    ini_write_string("contenido", "i" + string(i), ds_list_find_value(infos, i));
}
ini_close();
s_ini_md5_close("diccionario" + string(idweb) + ".ini");
ds_list_destroy(titulos);
ds_list_destroy(fotos);
ds_list_destroy(infos);


