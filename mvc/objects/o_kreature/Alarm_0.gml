if s_ini_md5_open("kreature" + string(idweb) + ".ini") {
    ini_open("kreature" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    fechamove = real(ini_read_string("config", "fechamove", "0"));
    tipok = real(ini_read_string("genes", "tipok", "0"));
    posx = real(ini_read_string("genes", "posx", "0"));
    posy = real(ini_read_string("genes", "posy", "0"));
    metax = real(ini_read_string("genes", "metax", "0"));
    metay = real(ini_read_string("genes", "metay", "0"));
    reloj_quiet = real(ini_read_string("genes", "reloj_quiet", "0"));
    reloj_move = real(ini_read_string("genes", "reloj_move", "0"));
    ini_close();
}


