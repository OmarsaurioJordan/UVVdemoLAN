/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var lond = ds_list_size(derecha);
        var loni = ds_list_size(izquierda);
        var buf = s_header(50, 10 + 2 * (lond + loni));
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_u16, lond);
        for (var i = 0; i < lond; i++) {
            buffer_write(buf, buffer_u16, ds_list_find_value(derecha, i));
        }
        buffer_write(buf, buffer_u16, loni);
        for (var i = 0; i < loni; i++) {
            buffer_write(buf, buffer_u16, ds_list_find_value(izquierda, i));
        }
        buffer_write(buf, buffer_string, pregunta);
        s_udp_send(buf, "");
    }
}


