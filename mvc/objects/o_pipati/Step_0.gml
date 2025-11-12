/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var buf = s_header(23, 8);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_u8, jugador_a);
        buffer_write(buf, buffer_u8, jugador_b);
        s_udp_send(buf, "");
    }
}


