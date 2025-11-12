ini_open("molino.ini");
ini_write_string("config", "fecha", string(fecha));
ini_write_string("opinion", "opinador", ds_grid_write(opinador));
ini_close();
s_ini_md5_close("molino.ini");


