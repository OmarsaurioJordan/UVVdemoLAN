ini_open("monumento" + string(idweb) + ".ini");
ini_write_string("config", "idweb", string(idweb)); // inutil
ini_write_string("config", "fecha", string(fecha));
ini_write_string("imagen", "imagen", imagenpng);
ini_write_string("imagen", "mibandera", string(mibandera));
ini_close();
s_ini_md5_close("monumento" + string(idweb) + ".ini");
if spritefull != noone {
    sprite_delete(spritefull);
}


