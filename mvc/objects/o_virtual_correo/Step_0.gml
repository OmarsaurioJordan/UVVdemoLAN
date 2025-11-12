/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var tot = ds_list_size(mensajes);
        var buf = s_header(16, 6 + tot * 8);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_u16, tot);
        for (var i = 0; i < tot; i++) {
            buffer_write(buf, buffer_string, ds_list_find_value(mensajes, i));
            buffer_write(buf, buffer_u16, ds_list_find_value(emisores, i));
            buffer_write(buf, buffer_u16, ds_list_find_value(receptores, i));
            buffer_write(buf, buffer_u32, ds_list_find_value(fechas, i));
        }
        s_udp_send(buf, "");
    }
}


