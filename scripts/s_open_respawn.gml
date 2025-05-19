// solo pone los respawn

if !m_editor {
    s_ini_md5_open("mapa.ini");
    ini_open("mapa.ini");
    var n = 0;
    var xx, yy;
    while ini_key_exists("punto", "x" + string(n)) {
        if ini_read_string("punto", "t" + string(n), "") == "respawn" {
            xx = real(ini_read_string("punto", "x" + string(n), "0"));
            yy = real(ini_read_string("punto", "y" + string(n), "0"));
            instance_create(xx, yy, o_pnt_respawn);
        }
        n++;
    }
    ini_close();
}

