/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var buf = s_header(20, 9);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        for (var i = 0; i < 3; i++) {
            buffer_write(buf, buffer_u8, carta[i]);
        }
        s_udp_send(buf, "");
    }
}


