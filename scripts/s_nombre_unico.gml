// arg0: id de usuario que pregunta si su nombre es unico

var nnn = argument0.nombremas;
with o_usuario {
    if id != argument0 and nombremas == nnn {
        if registro > argument0.registro {
            nombre = "usr" + string(irandom(9)) +
                string(irandom(9)) + string(irandom(9));
            nombremas = nombre;
        }
        else {
            argument0.nombre = "usr" + string(irandom(9)) +
                string(irandom(9)) + string(irandom(9));
            argument0.nombremas = argument0.nombre;
        }
    }
}

