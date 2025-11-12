ini_open("virus" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("virus", "mortandad", string(mortandad));
ini_write_string("virus", "incubacion", string(incubacion));
ini_write_string("virus", "enfermedad", string(enfermedad));
ini_write_string("virus", "transmision", string(transmision));
ini_write_string("virus", "curatodos", string(curatodos));
ini_close();
s_ini_md5_close("virus" + string(idweb) + ".ini");


