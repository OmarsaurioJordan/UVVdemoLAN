/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var tot = ds_list_size(melodia);
        var buf = s_header(7, 9 + tot);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_u8, mute);
        buffer_write(buf, buffer_u16, tot);
        for (var i = 0; i < tot; i++) {
            buffer_write(buf, buffer_u8, ds_list_find_value(melodia, i));
        }
        s_udp_send(buf, "");
    }
    
    // sonar
    reloj_entrenotas = max(0, reloj_entrenotas - dlt);
    var tot = ds_list_size(melodia) - 1;
    if tot >= 1 and mute == 0 {
        reloj_melodia -= dlt;
        if reloj_melodia <= 0 {
            reloj_melodia = lerp(o_control.entrenotas + 0.05, 1,
                ds_list_find_value(melodia, 0) / 9);
            switch ds_list_find_value(melodia, aguja + 1) {
                case 1: s_piano_nota(id, a_nota_med_do, false); break;
                case 2: s_piano_nota(id, a_nota_med_re, false); break;
                case 3: s_piano_nota(id, a_nota_med_mi, false); break;
                case 4: s_piano_nota(id, a_nota_med_fa, false); break;
                case 5: s_piano_nota(id, a_nota_med_sol, false); break;
                case 6: s_piano_nota(id, a_nota_med_la, false); break;
                case 7: s_piano_nota(id, a_nota_med_si, false); break;
            }
            aguja++;
            if aguja >= tot {
                aguja = 0;
            }
        }
    }
}


