// arg0: idweb del otro jugador
// ret: id de buffer (no olvidar destruirlo luego)

var buf = s_header(32, 4);
buffer_write(buf, buffer_u16, argument0);
buffer_write(buf, buffer_u16, o_control.mipropio.idweb);
return buf;

