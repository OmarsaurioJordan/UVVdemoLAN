/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var buf = s_header(21, 7 + string_length(palabra + adivinada + historial));
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_string, palabra);
        buffer_write(buf, buffer_string, adivinada);
        buffer_write(buf, buffer_u8, vidas);
        buffer_write(buf, buffer_string, historial);
        s_udp_send(buf, "");
    }
}


