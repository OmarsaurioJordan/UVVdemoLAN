// arg0: str nombre de variable
// arg1: valor por defecto str o real
// ret: valor

var v = argument1;;
ini_open("configuracion.ini");
if is_string(argument1) {
    v = ini_read_string("config", argument0, v);
}
else {
    v = real(ini_read_string("config", argument0, string(v)));
}
ini_close();
return v;

