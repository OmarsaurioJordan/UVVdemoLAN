/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var tot = 0;
        for (var i = 0; i < ds_list_size(textos); i++) {
            tot += string_length(ds_list_find_value(textos, i));
        }
        var buf = s_header(18, 11 + tot);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_u8, leido);
        buffer_write(buf, buffer_u32, futuro);
        for (var i = 0; i < ds_list_size(textos); i++) {
            buffer_write(buf, buffer_string, ds_list_find_value(textos, i));
        }
        s_udp_send(buf, "");
    }
    
    // ver si hacer la confesion
    if random(1) < 0.003 {
        if (leido == 1 or ds_list_find_value(textos, 0) == "") and
                futuro - s_current_time() <= 0 {
            futuro = s_current_time() + 10;
            ds_list_replace(textos, 0, "");
            var tot = ds_list_size(textos);
            var freno = 0;
            var i;
            while true {
                i = irandom_range(1, tot - 1);
                ds_list_replace(textos, 0, ds_list_find_value(textos, i));
                ds_list_replace(textos, i, "");
                if ds_list_find_value(textos, 0) != "" {
                    leido = 0;
                    break;
                }
                freno++;
                if freno > 10 * tot {
                    break;
                }
            }
                
        }
    }
}


