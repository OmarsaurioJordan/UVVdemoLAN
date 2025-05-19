// arg0: posicion x
// arg1: posicion y
// arg2: str texto
// arg3: si enviar udp

var aux = noone;
with o_numero {
    if !activo {
        activo = true;
        depth = -argument1;
        x = argument0;
        y = argument1;
        altu = 0;
        aux = id;
        break;
    }
}
if aux == noone {
    aux = instance_create(argument0, argument1, o_numero);
}
aux.texto = argument2;
if argument3 {
    var buf = s_header(57, 4);
    buffer_write(buf, buffer_u16, argument0);
    buffer_write(buf, buffer_u16, argument1);
    buffer_write(buf, buffer_string, argument2);
    s_udp_send(buf, "");
}

