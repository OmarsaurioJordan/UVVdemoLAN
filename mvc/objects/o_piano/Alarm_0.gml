if s_ini_md5_open("piano" + string(idweb) + ".ini") {
    ini_open("piano" + string(idweb) + ".ini");
    fecha = real(ini_read_string("config", "fecha", "0"));
    mute = real(ini_read_string("config", "mute", "0"));
    var nts = ini_read_string("melodia", "notas", "");
    if nts != "" {
        ds_list_read(melodia, nts);
        aguja = 0;
    }
    ini_close();
}


