// arg0: idweb de usuario
// ret: str nombre del usuario

if argument0 == 0 {
    return "???";
}
with o_usuario {
    if idweb == argument0 {
        return nombre;
    }
}
return "???";

