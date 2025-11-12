// ret: buffer con criaturas posicion, ojo, eliminarlo luego

var tot = instance_number(o_kreature);
var buf = s_header(53, 23 * tot);
with o_kreature {
    buffer_write(buf, buffer_u16, idweb);
    buffer_write(buf, buffer_u32, fechamove);
    buffer_write(buf, buffer_u16, posx);
    buffer_write(buf, buffer_u16, posy);
    buffer_write(buf, buffer_u16, metax);
    buffer_write(buf, buffer_u16, metay);
    buffer_write(buf, buffer_u32, reloj_quiet);
    buffer_write(buf, buffer_u32, reloj_move);
    buffer_write(buf, buffer_u8, tipok);
}
return buf;

