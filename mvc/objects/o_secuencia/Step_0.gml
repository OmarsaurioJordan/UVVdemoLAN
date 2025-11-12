/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var buf = s_header(36, 6 + string_length(secuencia + intento));
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_string, secuencia);
        buffer_write(buf, buffer_string, intento);
        s_udp_send(buf, "");
    }
    
    // reproducir secuencia
    if visible {
        if ultima <= string_length(secuencia) {
            reloj_secu -= dlt;
            if reloj_secu <= 0 {
                reloj_secu = o_control.secuencia_velocidad;
                ultima++;
            }
        }
        else if repeticion <= string_length(intento) {
            reloj_secu -= dlt;
            if reloj_secu <= 0 {
                reloj_secu = o_control.secuencia_velocidad;
                repeticion++;
            }
        }
    }
}


