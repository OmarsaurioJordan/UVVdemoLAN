/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var aux = ds_list_find_value(archivos, file_sinc);
        if ds_list_empty(aux) {
            var buf = s_header(14, 11);
            buffer_write(buf, buffer_u16, idweb);
            buffer_write(buf, buffer_u32, fecha);
            buffer_write(buf, buffer_u8, file_sinc);
            buffer_write(buf, buffer_u32, fechas[file_sinc]);
            s_udp_send(buf, "");
        }
        else if string_count("0", ds_list_find_value(aux, 2)) == 0 {
            var lefile = ds_list_find_value(aux, 3 + turno_sinc);
            var buf = s_header(14, 13 + string_length(lefile));
            buffer_write(buf, buffer_u16, idweb);
            buffer_write(buf, buffer_u32, fecha);
            buffer_write(buf, buffer_u8, file_sinc);
            buffer_write(buf, buffer_u32, fechas[file_sinc]);
            buffer_write(buf, buffer_string, ds_list_find_value(aux, 0)); // name file
            var tot = real(ds_list_find_value(aux, 1));
            buffer_write(buf, buffer_u8, tot); // total
            buffer_write(buf, buffer_u8, turno_sinc); // trozo actual
            buffer_write(buf, buffer_string, lefile);
            s_udp_send(buf, "");
            turno_sinc++;
            if turno_sinc >= tot {
                turno_sinc = 0;
                file_sinc++;
                if file_sinc >= ds_list_size(archivos) {
                    file_sinc = 0;
                }
            }
            else {
                reloj_sinc = 1;
            }
        }
    }
}


