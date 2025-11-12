/// @description  sincronia

if !m_editor {
    if irandom(room_speed - 1) == 0 {
        if s_current_time() - fecha >= o_control.dura_difusion {
            texto = "";
            fecha = s_current_time();
        }
    }
    if s_ciclo_actualizador(id) {
        var buf = s_header(5, 6 + string_length(texto));
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_string, texto);
        s_udp_send(buf, "");
    }
}


