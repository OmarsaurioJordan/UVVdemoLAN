ini_open("kreature" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("config", "fechamove", string(fechamove));
ini_write_string("genes", "tipok", string(tipok));
ini_write_string("genes", "posx", string(posx));
ini_write_string("genes", "posy", string(posy));
ini_write_string("genes", "metax", string(metax));
ini_write_string("genes", "metay", string(metay));
ini_write_string("genes", "reloj_quiet", string(reloj_quiet));
ini_write_string("genes", "reloj_move", string(reloj_move));
ini_close();
s_ini_md5_close("kreature" + string(idweb) + ".ini");


