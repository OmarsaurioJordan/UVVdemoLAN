/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var totp = ds_list_size(preguntas);
        var totn = ds_list_size(notas);
        var buf = s_header(51, 8 + 3 * totn);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_u8, totp);
        for (var i = 0; i < totp; i++) {
            buffer_write(buf, buffer_string, ds_list_find_value(preguntas, i));
        }
        buffer_write(buf, buffer_u8, totn);
        for (var i = 0; i < totn; i++) {
            buffer_write(buf, buffer_u16, ds_list_find_value(estudiantes, i));
            buffer_write(buf, buffer_u8, ds_list_find_value(notas, i));
        }
        s_udp_send(buf, "");
    }
}


