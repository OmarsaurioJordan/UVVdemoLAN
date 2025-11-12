/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var totp = ds_list_size(preguntas);
        var tote = ds_list_size(estudiantes);
        var buf = s_header(52, 10 + 2 * tote + 2 * o_control.encuesta_max);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_u8, totp);
        for (var i = 0; i < totp; i++) {
            buffer_write(buf, buffer_string, ds_list_find_value(preguntas, i));
        }
        buffer_write(buf, buffer_u8, tote);
        for (var i = 0; i < tote; i++) {
            buffer_write(buf, buffer_u16, ds_list_find_value(estudiantes, i));
        }
        for (var i = 0; i < o_control.encuesta_max; i++) {
            buffer_write(buf, buffer_u16, ds_list_find_value(respuestas, i));
        }
        buffer_write(buf, buffer_u16, genero);
        s_udp_send(buf, "");
    }
}


