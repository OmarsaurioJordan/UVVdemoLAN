/// @description s_header(ind_envio, size_data);
/// @param ind_envio
/// @param  size_data
// crea un buffer con la cabecera del software y lo deja listo
// para escribir el resto de datos y enviarlo

var buf = buffer_create(5 + argument1, buffer_grow, 1);
buffer_seek(buf, buffer_seek_start, 0);
buffer_write(buf, buffer_u16, m_web);
buffer_write(buf, buffer_u8, m_version);
buffer_write(buf, buffer_u8, g_network);
buffer_write(buf, buffer_u8, argument0);
return buf;

