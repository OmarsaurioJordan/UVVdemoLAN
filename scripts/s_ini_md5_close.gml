// arg0: str nombre de archivo ini
// pone el valor de md5 al ini

ini_open(argument0);
if ini_section_exists("antihack") {
    ini_section_delete("antihack");
}
ini_close();
var m = md5_string_unicode(md5_file(argument0) + "Omiloco3832019");
ini_open(argument0);
ini_write_string("antihack", "key", m);
ini_close();

