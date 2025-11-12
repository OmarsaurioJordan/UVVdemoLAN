ini_open("presentacion" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("config", "aguja", string(aguja));
if ini_section_exists("contenido") {
    ini_section_delete("contenido");
}
for (var i = 0; i < ds_list_size(fotos); i++) {
    ini_write_string("contenido", "f" + string(i), ds_list_find_value(fotos, i));
}
ini_close();
s_ini_md5_close("presentacion" + string(idweb) + ".ini");
ds_list_destroy(fotos);


