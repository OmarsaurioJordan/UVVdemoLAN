// arg0: id de usuario que se convierte en buffer
// ret: id de buffer (no olvidar destruirlo luego)

var buf = s_header(19, 6);
with argument0 {
    buffer_write(buf, buffer_u16, idweb);
    buffer_write(buf, buffer_u16, posx);
    buffer_write(buf, buffer_u16, posy);
}
return buf;

