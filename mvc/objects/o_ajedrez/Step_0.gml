/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var buf = s_header(33, 9 + 8 * 8);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_u8, turno);
        buffer_write(buf, buffer_u16, turno_max);
        for (var h = 0; h < 8; h++) {
            for (var w = 0; w < 8; w++) {
                buffer_write(buf, buffer_string, ds_grid_get(tablero, w, h));
            }
        }
        s_udp_send(buf, "");
    }
}


