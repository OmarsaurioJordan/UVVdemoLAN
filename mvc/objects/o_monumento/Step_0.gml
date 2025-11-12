/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var buf = s_header(8, 7 + string_length(imagenpng));
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_string, imagenpng);
        buffer_write(buf, buffer_u8, mibandera);
        s_udp_send(buf, "");
    }
}


