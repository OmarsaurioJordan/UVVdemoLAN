/// @description  sincronia

if !m_editor {
    reloj_delta += dlt;
    if s_ciclo_actualizador(id) {
        if s_permiso_pro() {
            if enjuego {
                reloj_sinc = 0.3;
            }
        }
        var buf = s_header(41, 29);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_f32, reloj_delta);
        buffer_write(buf, buffer_u8, puntos[0]);
        buffer_write(buf, buffer_u8, puntos[1]);
        buffer_write(buf, buffer_f32, reloj_juego);
        buffer_write(buf, buffer_f32, reloj_balon);
        if enjuego {
            buffer_write(buf, buffer_u8, 1);
        }
        else {
            buffer_write(buf, buffer_u8, 0);
        }
        var yop = id;
        var bll = noone;
        with o_balon {
            if origen == yop {
                bll = id;
                break;
            }
        }
        if bll != noone {
            buffer_write(buf, buffer_u16, bll.posx);
            buffer_write(buf, buffer_u16, bll.posy);
            buffer_write(buf, buffer_u16, bll.direcc);
            buffer_write(buf, buffer_u16, bll.velocity);
        }
        else {
            buffer_write(buf, buffer_u16, 0);
            buffer_write(buf, buffer_u16, 0);
            buffer_write(buf, buffer_u16, 0);
            buffer_write(buf, buffer_u16, 0);
        }
        s_udp_send(buf, "");
        fecha = s_current_time();
        reloj_delta = 0;
    }
    
    // administrar juego
    if s_permiso_pro() {
        if enjuego {
            reloj_sinc = min(reloj_sinc, 1);
            // finalizar juego
            if reloj_juego != 0 {
                reloj_juego -= dlt;
                if reloj_juego <= 0 {
                    reloj_juego = 0;
                    var yop = id;
                    with o_balon {
                        if origen == yop {
                            instance_destroy();
                            break;
                        }
                    }
                    reloj_balon = 0;
                    enjuego = false;
                }
            }
            // crear balon
            if reloj_balon != 0 {
                reloj_balon -= dlt;
                if reloj_balon <= 0 {
                    reloj_balon = 0;
                    var yop = id;
                    var bll = noone;
                    with o_balon {
                        if origen == yop {
                            bll = id;
                            break;
                        }
                    }
                    if bll == noone {
                        var ank = instance_nearest(x, y + 100, o_pnt_futbol);
                        bll = instance_create(ank.x, ank.y, o_balon);
                        bll.origen = id;
                    }
                }
            }
        }
        // eliminar balon sin juego
        else if random(1) < 0.03 {
            var yop = id;
            with o_balon {
                if origen == yop {
                    instance_destroy();
                    break;
                }
            }
        }
    }
}


