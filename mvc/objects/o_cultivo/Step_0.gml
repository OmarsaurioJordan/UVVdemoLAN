/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var tot = 0;
        var yop = id;
        with o_planta {
            if origen == yop {
                tot++;
            }
        }
        var buf = s_header(31, 7 + 10 * tot);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_u8, tot);
        with o_planta {
            if origen == yop {
                buffer_write(buf, buffer_u16, x);
                buffer_write(buf, buffer_u16, y);
                buffer_write(buf, buffer_u8, tipo);
                buffer_write(buf, buffer_u8, vida);
                buffer_write(buf, buffer_u32, fecha);
            }
        }
        s_udp_send(buf, "");
    }
    
    // hacer crecer plantas
    if random(1) < 0.01 {
        var yop = id;
        var ttt = s_current_time();
        var vid;
        vid[0] = 60 * 6 / o_control.relojes_acelerados; // segundos a brote
        vid[1] = 60 * 6 / o_control.relojes_acelerados; // segundos a joven
        vid[2] = 60 * 10 / o_control.relojes_acelerados; // segundos a madura
        vid[3] = 60 * 30 / o_control.relojes_acelerados; // segundos a marchita
        vid[4] = 60 * 10 / o_control.relojes_acelerados; // segundos a muerta
        vid[5] = 60 * 30 / o_control.relojes_acelerados; // segundos a desaparecer
        var ok = false;
        with o_planta {
            if origen == yop and random(1) < 0.01 {
                if vida < 5 {
                    if ttt - fecha > vid[vida] {
                        vida++;
                        fecha = ttt;
                        ok = true;
                    }
                }
                else if ttt - fecha > vid[vida] {
                    instance_destroy();
                }
            }
        }
        if ok {
            reloj_sinc = 0;
        }
    }
}


