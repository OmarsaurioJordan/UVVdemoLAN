ini_open("lienzo" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("dibujo", "imagen", ds_grid_write(imagen));
ini_write_string("dibujo", "transp", ds_grid_write(transp));
ini_close();
s_ini_md5_close("lienzo" + string(idweb) + ".ini");


