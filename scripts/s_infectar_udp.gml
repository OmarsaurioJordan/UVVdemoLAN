// arg0: idweb de el sujeto a tratar
// arg1: 0:infectar, 1:curar, 2:curar todos

var buf = s_header(45, 3);
buffer_write(buf, buffer_u8, argument1);
buffer_write(buf, buffer_u16, argument0);
s_udp_send(buf, "");

