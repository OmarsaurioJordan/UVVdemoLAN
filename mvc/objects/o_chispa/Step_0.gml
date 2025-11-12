if activo {
    if point_distance(x, y, mx, my) < 8 {
        activo = false;
        var aux = collision_point(mx, my, o_dispo, true, false);
        if aux != noone {
            var n = -1;
            for (var i = 0; i < 3; i++) {
                if aux.vecino[i] == origen {
                    n = i;
                    break;
                }
            }
            if n != -1 {
                switch aux.tipo {
                    case 14: // cable
                        if n == 0 {
                            var yop = id;
                            with aux {
                                if s_existe(vecino[1]) {
                                    var ch = s_busca_chispa();
                                    ch.x = yop.x; ch.y = yop.y;
                                    ch.mx = vecino[1].x;
                                    ch.my = vecino[1].y;
                                    ch.origen = id;
                                    ch.polo = yop.polo;
                                }
                                if s_existe(vecino[2]) {
                                    var ch = s_busca_chispa();
                                    ch.x = yop.x; ch.y = yop.y;
                                    ch.mx = vecino[2].x;
                                    ch.my = vecino[2].y;
                                    ch.origen = id;
                                    ch.polo = yop.polo;
                                }
                            }
                        }
                        break;
                    case 11: case 12: case 13: case 10: // opera
                        aux.entrada[n] = polo;
                        break;
                    case 0: case 1: // out
                        if n == 0 {
                            aux.salida = polo;
                            if aux.tipo == 1 and polo != 0 {
                                var nn = noone;
                                switch aux.valor {
                                    case 0: nn = a_tono_do; break;
                                    case 1: nn = a_tono_re; break;
                                    case 2: nn = a_tono_mi; break;
                                    case 3: nn = a_tono_fa; break;
                                    case 4: nn = a_tono_sol; break;
                                    case 5: nn = a_tono_la; break;
                                    case 6: nn = a_tono_si; break;
                                }
                                s_buzzer_nota(aux.x, aux.y, nn, false);
                            }
                        }
                        break;
                    case 2: // mem
                        aux.entrada[n] = polo;
                        break;
                    case 3: // delay
                        if n == 0 {
                            aux.delay[0] = polo;
                        }
                        break;
                }
            }
        }
    }
    else {
        direction = point_direction(x, y, mx, my);
        var vv = o_control.vel_chispa * dlt;
        x += lengthdir_x(vv, direction);
        y += lengthdir_y(vv, direction);
        depth = -y;
    }
}


