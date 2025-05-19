// arg0: posicion x
// arg1: posicion y
// arg2: direccion
// arg3: idweb de quien la creo
// arg4: grupo o color
// arg5: true si enviar para sincronizacion
// ret: id de bala

var aux = instance_create(argument0, argument1 - 1, o_bala);
aux.direction = argument2;
with o_usuario {
    if idweb == argument3 {
        aux.origen = id;
        break;
    }
}
aux.grupo = argument4;
if argument5 {
    var buf = s_header(28, 9);
    buffer_write(buf, buffer_u16, argument0);
    buffer_write(buf, buffer_u16, argument1);
    buffer_write(buf, buffer_u16, argument2);
    buffer_write(buf, buffer_u16, argument3);
    buffer_write(buf, buffer_u8, argument4);
    s_udp_send(buf, "");
}
return aux;

