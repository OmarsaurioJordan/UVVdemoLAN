/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var buf = s_header(48, 9 + string_length(numerito));
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_u16, ganador);
        buffer_write(buf, buffer_string, numerito);
        buffer_write(buf, buffer_u8, dado);
        s_udp_send(buf, "");
    }
    
    // buscar ganador para mostrarlo
    if random(1) < 0.01 {
        perfil_azar = noone;
        var yop = id;
        with o_usuario {
            if idweb == yop.ganador {
                yop.perfil_azar = id;
                break;
            }
        }
        if viejogana != ganador {
            s_audio(x, y, a_monedaso, false);
            viejogana = ganador;
        }
    }
}


