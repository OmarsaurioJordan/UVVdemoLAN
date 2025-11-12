// ret: id de buffer (no olvidar destruirlo luego)
// nota: total + (cadena de idweb + fecha de gadget) * total

var total = instance_number(o_especial) + instance_number(o_game) + 1;
var buf = s_header(46, 2 + 6 * total);
buffer_write(buf, buffer_u16, total);
with o_especial {
    buffer_write(buf, buffer_u16, idweb);
    buffer_write(buf, buffer_u32, fecha);
}
with o_game {
    buffer_write(buf, buffer_u16, idweb);
    buffer_write(buf, buffer_u32, fecha);
}
buffer_write(buf, buffer_u16, o_virtual_correo.idweb);
buffer_write(buf, buffer_u32, o_virtual_correo.fecha);
return buf;

