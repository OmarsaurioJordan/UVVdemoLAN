ini_open("memoria" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("config", "turno", string(turno));
ini_write_string("config", "u0", string(ultimo[0]));
ini_write_string("config", "u1", string(ultimo[1]));
var aux;
var tll = ds_grid_width(tablero);
for (var h = 0; h < tll; h++) {
    for (var w = 0; w < tll; w++) {
        aux = ds_grid_get(tablero, w, h);
        ini_write_string("tablero", "t" + string(w) + "_" + string(h), aux.tipo);
        ini_write_string("tablero", "m" + string(w) + "_" + string(h), aux.mostrado);
    }
}
ini_close();
s_ini_md5_close("memoria" + string(idweb) + ".ini");


