/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var tot = 0;
        var yop = id;
        with o_dispo {
            if origen == yop {
                tot++;
            }
        }
        var buf = s_header(27, 8 + 10 * tot);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_u8, mute);
        buffer_write(buf, buffer_u8, tot);
        with o_dispo {
            if origen == yop {
                buffer_write(buf, buffer_u16, x);
                buffer_write(buf, buffer_u16, y);
                buffer_write(buf, buffer_u8, name);
                buffer_write(buf, buffer_u8, tipo);
                buffer_write(buf, buffer_u8, valor);
                for (var i = 0; i < 3; i++) {
                    buffer_write(buf, buffer_u8, vecina[i]);
                }
            }
        }
        s_udp_send(buf, "");
    }
    
    // funcionamiento
    if mute == 0 and random(1) < 0.1 and visible {
        var ok = true;
        with o_chispa {
            if activo {
                ok = false;
                break;
            }
        }
        if !ok {
            exit;
        }
        var yop = id;
        with o_dispo {
            if origen == yop {
                for (var i = 0; i < 3; i++) {
                    if entrada[i] == -1 {
                        entrada[i] = irandom(1);
                    }
                }
                if delay[0] == -1 {
                    delay[0] = irandom(1);
                }
                switch tipo {
                    case 2: // mem
                        if entrada[1] == 1 {
                            memoria = entrada[0];
                        }
                        if s_existe(vecino[2]) {
                            var ch = s_busca_chispa();
                            ch.x = x; ch.y = y;
                            ch.mx = vecino[2].x;
                            ch.my = vecino[2].y;
                            ch.origen = id;
                            ch.polo = memoria;
                        }
                        break;
                    case 3: // delay
                        if s_existe(vecino[1]) {
                            var ch = s_busca_chispa();
                            ch.x = x; ch.y = y;
                            ch.mx = vecino[1].x;
                            ch.my = vecino[1].y;
                            ch.origen = id;
                            ch.polo = delay[valor];
                        }
                        break;
                    case 4: // azar
                        if s_existe(vecino[0]) {
                            var ch = s_busca_chispa();
                            ch.x = x; ch.y = y;
                            ch.mx = vecino[0].x;
                            ch.my = vecino[0].y;
                            ch.origen = id;
                            if irandom(valor) == 0 {
                                ante_azar = irandom(1);
                            }
                            ch.polo = ante_azar;
                        }
                        break;
                    case 5: // sensor
                        if s_existe(vecino[0]) {
                            var ch = s_busca_chispa();
                            ch.x = x; ch.y = y;
                            ch.mx = vecino[0].x;
                            ch.my = vecino[0].y;
                            ch.origen = id;
                            if collision_circle(x, y, (250 / 7) * (valor + 1),
                                    o_movil, true, false) {
                                ch.polo = 1;
                            }
                            else {
                                ch.polo = 0;
                            }
                        }
                        break;
                    case 6: // boton
                        if s_existe(vecino[0]) {
                            var ch = s_busca_chispa();
                            ch.x = x; ch.y = y;
                            ch.mx = vecino[0].x;
                            ch.my = vecino[0].y;
                            ch.origen = id;
                            ch.polo = 0;
                            if valor == 0 and keyboard_check(ord("Z")) { ch.polo = 1; }
                            else if valor == 1 and keyboard_check(ord("X")) { ch.polo = 1; }
                            else if valor == 2 and keyboard_check(ord("C")) { ch.polo = 1; }
                            else if valor == 3 and keyboard_check(ord("V")) { ch.polo = 1; }
                            else if valor == 4 and keyboard_check(ord("B")) { ch.polo = 1; }
                            else if valor == 5 and keyboard_check(ord("N")) { ch.polo = 1; }
                            else if valor == 6 and keyboard_check(ord("M")) { ch.polo = 1; }
                        }
                        break;
                    case 7: // oscila
                        if s_existe(vecino[0]) {
                            var ch = s_busca_chispa();
                            ch.x = x; ch.y = y;
                            ch.mx = vecino[0].x;
                            ch.my = vecino[0].y;
                            ch.origen = id;
                            var t = (valor + 1) * 2;
                            if tiempo < t / 2 {
                                ch.polo = 0;
                            }
                            else {
                                ch.polo = 1;
                            }
                            tiempo++;
                            if tiempo >= t {
                                tiempo = 0;
                            }
                        }
                        break;
                    case 8: // true
                        if s_existe(vecino[0]) {
                            var ch = s_busca_chispa();
                            ch.x = x; ch.y = y;
                            ch.mx = vecino[0].x;
                            ch.my = vecino[0].y;
                            ch.origen = id;
                            ch.polo = 1;
                        }
                        break;
                    case 9: // false
                        if s_existe(vecino[0]) {
                            var ch = s_busca_chispa();
                            ch.x = x; ch.y = y;
                            ch.mx = vecino[0].x;
                            ch.my = vecino[0].y;
                            ch.origen = id;
                            ch.polo = 0;
                        }
                        break;
                    case 10: // not
                        if s_existe(vecino[1]) {
                            var ch = s_busca_chispa();
                            ch.x = x; ch.y = y;
                            ch.mx = vecino[1].x;
                            ch.my = vecino[1].y;
                            ch.origen = id;
                            if entrada[0] == 0 {
                                ch.polo = 1;
                            }
                            else {
                                ch.polo = 0;
                            }
                        }
                        break;
                    case 11: // or
                        if s_existe(vecino[2]) {
                            var ch = s_busca_chispa();
                            ch.x = x; ch.y = y;
                            ch.mx = vecino[2].x;
                            ch.my = vecino[2].y;
                            ch.origen = id;
                            if entrada[0] == 0 and entrada[1] == 0 {
                                ch.polo = 0;
                            }
                            else {
                                ch.polo = 1;
                            }
                        }
                        break;
                    case 12: // and
                        if s_existe(vecino[2]) {
                            var ch = s_busca_chispa();
                            ch.x = x; ch.y = y;
                            ch.mx = vecino[2].x;
                            ch.my = vecino[2].y;
                            ch.origen = id;
                            if entrada[0] == 1 and entrada[1] == 1 {
                                ch.polo = 1;
                            }
                            else {
                                ch.polo = 0;
                            }
                        }
                        break;
                    case 13: // xor
                        if s_existe(vecino[2]) {
                            var ch = s_busca_chispa();
                            ch.x = x; ch.y = y;
                            ch.mx = vecino[2].x;
                            ch.my = vecino[2].y;
                            ch.origen = id;
                            if entrada[0] != entrada[1] {
                                ch.polo = 1;
                            }
                            else {
                                ch.polo = 0;
                            }
                        }
                        break;
                }
                for (var i = 0; i < 3; i++) {
                    entrada[i] = -1;
                }
                var dly;
                dly[0] = -1;
                for (var d = 0; d < 6; d++) {
                    dly[d + 1] = delay[d];
                }
                delay = dly;
            }
        }
    }
}


