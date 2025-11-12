// arg0: str nombre de archivo ini
// ret: true si el md5 esta bien y existe el archivo

var res = false;
if file_exists(argument0) {
    ini_open(argument0);
    var m = "";
    if ini_section_exists("antihack") {
        m = ini_read_string("antihack", "key", "");
        ini_section_delete("antihack");
    }
    ini_close();
    if md5_string_unicode(md5_file(argument0) + "Omiloco3832019") == m {
        res = true;
        ini_open(argument0);
        ini_write_string("antihack", "key", m);
        ini_close();
    }
    else {
        file_delete(argument0);
    }
}
return res;

