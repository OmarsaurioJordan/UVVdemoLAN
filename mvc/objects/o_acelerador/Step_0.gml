/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var buf = s_header(40, 13);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        if activo {
            buffer_write(buf, buffer_u8, 1);
        }
        else {
            buffer_write(buf, buffer_u8, 0);
        }
        buffer_write(buf, buffer_u8, calor_ini);
        buffer_write(buf, buffer_u8, cadencia);
        buffer_write(buf, buffer_u8, girar);
        buffer_write(buf, buffer_u16, direccional);
        buffer_write(buf, buffer_u8, disparado);
        s_udp_send(buf, "");
    }
    
    if visible and activo {
        reloj_parti -= dlt;
        if reloj_parti <= 0 {
            reloj_parti = reloj_parti_max * (cadencia + 1);
            var cc, dd;
            repeat 1 + irandom(3) {
                dd = random(direccional);
                switch calor_ini {
                    case 0: cc = 0; break;
                    case 1: cc = 1; break;
                    case 2: cc = 0.5; break;
                    case 3: cc = choose(0, 0.5, 1); break;
                }
                s_crea_particula(x + lengthdir_x(16, dd),
                    y + lengthdir_y(16, dd), cc, dd,
                    veloci_ini * disparado, vida_particula);
            }
            // sonido
            if sonido != noone {
                if !audio_is_playing(sonido) {
                    sonido = noone;
                }
            }
            if sonido == noone {
                sonido = audio_play_sound_at(a_acelerador, x, y, 64, 48,
                    __view_get( e__VW.WView, 0 ) * 0.5, 1, false, 18);
                audio_sound_gain(sonido, 0.5, 0);
            }
        }
    }
}


