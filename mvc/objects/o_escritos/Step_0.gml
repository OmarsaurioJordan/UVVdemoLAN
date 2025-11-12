/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var tot = 0;
        for (var i = 0; i < ds_list_size(textos); i++) {
            tot += string_length(ds_list_find_value(textos, i));
        }
        var buf = s_header(10, 6 + tot);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        for (var i = 0; i < ds_list_size(textos); i++) {
            buffer_write(buf, buffer_string, ds_list_find_value(textos, i));
        }
        s_udp_send(buf, "");
    }
}


