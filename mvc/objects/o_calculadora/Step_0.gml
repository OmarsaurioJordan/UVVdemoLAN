/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var buf = s_header(39, 10 + string_length(pregunta));
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_string, pregunta);
        for (var i = 0; i < 4; i++) {
            buffer_write(buf, buffer_string, respuesta[i]);
        }
        buffer_write(buf, buffer_u8, verdadera);
        buffer_write(buf, buffer_u8, nivel);
        buffer_write(buf, buffer_u8, puntos[0]);
        buffer_write(buf, buffer_u8, puntos[1]);
        s_udp_send(buf, "");
    }
    
    // juego solo
    if respuesta[0] != "+" {
        var iz = collision_point(x - 46, y, o_usuario, false, false);
        var de = collision_point(x + 46, y, o_usuario, false, false);
        if de xor iz {
            if s_current_time() - fecha > 1 + o_control.calculadora_solo {
                if de != noone {
                    s_calculadora(id, false, true, -1);
                    fecha = s_current_time();
                    reloj_sinc = 0;
                }
                else {
                    s_calculadora(id, false, false, -1);
                    fecha = s_current_time();
                    reloj_sinc = 0;
                }
            }
        }
    }
    
    if pregunta != viej_pregunta {
        var asd = audio_play_sound_at(a_calculadora, x, y, 64, 48,
            __view_get( e__VW.WView, 0 ) * 0.5, 1, false, 2);
        audio_sound_gain(asd, 0.6, 0);
    }
    viej_pregunta = pregunta;
}


