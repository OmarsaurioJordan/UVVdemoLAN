/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var buf = s_header(255, 10);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_u8, tipo);
        buffer_write(buf, buffer_u8, amplitud);
        buffer_write(buf, buffer_u8, frecuencia);
        buffer_write(buf, buffer_u8, desfase);
        s_udp_send(buf, "");
    }
    
    // crear particulas
    if visible {
        var frec = lerp(0.6, 2, frecuencia / 9);
        reloj_t += dlt;
        if reloj_t >= frec {
            reloj_t -= frec;
        }
        reloj_signal -= dlt;
        if reloj_signal <= 0 {
            reloj_signal = o_control.signal_reloj;
            // crear u obtener particula
            var aux = noone;
            var yop = id;
            with o_psig {
                if !activo {
                    activo = true;
                    x = yop.x + 32;
                    y = yop.y - 1;
                    orix = x;
                    aux = id;
                    break;
                }
            }
            if aux == noone {
                aux = instance_create(x + 32, y - 1, o_psig);
            }
            // depurar segun tipo de onda
            var des = (desfase / 10) * 70; // 9+1 para poder tener punto central
            var amp = (amplitud / 9) * 35;
            switch tipo {
                case 0: // seno
                    amp *= sin(2 * pi * (reloj_t / frec));
                    break;
                case 1: // triangular
                    var f = frec / 2;
                    if reloj_t > f {
                        amp = lerp(amp, -amp, (reloj_t - f) / f);
                    }
                    else {
                        amp = lerp(-amp, amp, reloj_t / f);
                    }
                    break;
                case 2: // cuadrada
                    if reloj_t > frec / 2 {
                        amp *= -1;
                    }
                    break;
                case 3: // dienteSube
                    amp = lerp(-amp, amp, reloj_t / frec);
                    break;
                case 4: // dienteBaja
                    amp = lerp(amp, -amp, reloj_t / frec);
                    break;
                case 5: // azar
                    if frecuencia == 0 {
                        amp = random_range(-amp, amp);
                    }
                    else {
                        var vent = amp * lerp(0.5, 0.1, (frecuencia - 1) / 8);
                        amp = clamp(ant_amp + random_range(-vent, vent), -amp, amp);
                    }
                    break;
            }
            aux.altura = 8 + clamp(des + amp, 0, 70);
            ant_amp = amp;
        }
    }
}


