/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var buf = s_header(37, 10);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_u8, angulo);
        buffer_write(buf, buffer_u16, direction);
        buffer_write(buf, buffer_u8, fuerza);
        s_udp_send(buf, "");
    }
    
    if visible {
        reloj_tiro = max(0, reloj_tiro - dlt);
    }
}


