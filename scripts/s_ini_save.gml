// arg0: str nombre de variable
// arg1: valor de variable str o real

ini_open("configuracion.ini");
var v = argument1;
if is_real(v) {
    v = string(v);
}
ini_write_string("config", argument0, v);
ini_close();

