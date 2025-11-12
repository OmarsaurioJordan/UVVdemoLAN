if file_exists("libelulas.ini") {
    ini_open("libelulas.ini");
    var lug = o_pnt_lago1.id;
    x = real(ini_read_string("lib" + string(idloc), "x", string(lug.x + random(10))));
    y = real(ini_read_string("lib" + string(idloc), "y", string(lug.y + random(10))));
    ini_close();
}


