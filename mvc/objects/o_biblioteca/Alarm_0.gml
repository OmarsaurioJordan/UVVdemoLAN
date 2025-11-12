if s_ini_md5_open("biblioteca" + string(idweb) + ".ini") {
    ini_open("biblioteca" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    var aux, sec, n;
    for (var a = 0; a < ds_list_size(archivos); a++) {
        sec = "archivo" + string(a);
        if ini_section_exists(sec) {
            n = 0;
            fechas[a] = real(ini_read_string(sec, "fecha", "0"));
            aux = ds_list_find_value(archivos, a);
            ds_list_clear(aux);
            while ini_key_exists(sec, "p" + string(n)) {
                ds_list_add(aux, ini_read_string(sec, "p" + string(n), ""));
                n++;
            }
        }
    }
    ini_close();
}


