/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        if ds_list_empty(archivo) {
            var buf = s_header(4, 7);
            buffer_write(buf, buffer_u16, idweb);
            buffer_write(buf, buffer_u32, fecha);
            buffer_write(buf, buffer_u8, mute);
            s_udp_send(buf, "");
        }
        else if string_count("0", ds_list_find_value(archivo, 2)) == 0 {
            var lefile = ds_list_find_value(archivo, 3 + turno_sinc);
            var tot = real(ds_list_find_value(archivo, 1));
            var buf = s_header(4, 11 + string_length(lefile));
            buffer_write(buf, buffer_u16, idweb);
            buffer_write(buf, buffer_u32, fecha);
            buffer_write(buf, buffer_u8, mute);
            buffer_write(buf, buffer_u16, real(ds_list_find_value(archivo, 0))); // ind snd
            buffer_write(buf, buffer_u8, tot); // total
            buffer_write(buf, buffer_u8, turno_sinc); // trozo actual
            buffer_write(buf, buffer_string, lefile);
            s_udp_send(buf, "");
            turno_sinc++;
            if turno_sinc >= tot {
                turno_sinc = 0;
            }
            else {
                reloj_sinc = 1;
            }
        }
    }
    
    // tratar de sonar
    s_anima_paso(id, 0.1, 7);
    reloj_sonar -= dlt;
    if reloj_sonar <= 0 {
        reloj_sonar = o_control.relojini_parlante + random(1);
        s_suena_parlante(id);
    }
}


