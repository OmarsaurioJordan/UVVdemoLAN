/// @description  buscar parejas
var tramo = lerp(0.2, 0.6, pasion);
s_anima_paso(id, tramo, 3);
s_anima_osc(id, 0, tramo * 3, 3);
if cercano_A != noone and random(1) < 0.5{
    if point_distance(x, y, cercano_A.x, cercano_A.y) > o_control.cerca_especial / 2 or
            point_distance(x, y, cercano_B.x, cercano_B.y) > o_control.cerca_especial / 2 {
        cercano_A = noone;
        cercano_B = noone;
        exit;
    }
}
if !m_editor and random(1) < 0.01 {
    pasion = random(1);
    cercano_B = noone;
    cercano_A = instance_nearest(x, y, o_usuario);
    if point_distance(x, y, cercano_A.x, cercano_A.y) > o_control.cerca_especial / 2 {
        cercano_A = noone;
        exit;
    }
    var yop = id;
    var ok;
    if cercano_A.estaonline {
        for (var c = 0; c < o_control.total_contactos; c++) {
            if cercano_A.amigi[c] == m_cont_love and cercano_A.amigo[c] != 0 {
                with o_usuario {
                    if id != yop.cercano_A and idweb == yop.cercano_A.amigo[c] {
                        yop.cercano_B = id;
                        break;
                    }
                }
                if cercano_B != noone {
                    if cercano_B.estaonline {
                        ok = false;
                        for (var h = 0; h < o_control.total_contactos; h++) {
                            if cercano_B.amigi[c] == m_cont_love and cercano_B.amigo[c] == cercano_A.idweb {
                                if point_distance(x, y, cercano_B.x, cercano_B.y) < o_control.cerca_especial / 2 {
                                    ok = true;
                                    break;
                                }
                            }
                        }
                        if ok {
                            // poner virus
                            if cercano_A.salud > 1 and cercano_B.salud == 0 {
                                cercano_B.salud = s_current_time();
                                s_infectar_udp(cercano_B.idweb, 0);
                            }
                            else if cercano_B.salud > 1 and cercano_A.salud == 0 {
                                cercano_A.salud = s_current_time();
                                s_infectar_udp(cercano_A.idweb, 0);
                            }
                        }
                        else {
                            cercano_B = noone;
                        }
                    }
                    else {
                        cercano_B = noone;
                    }
                }
            }
        }
        if cercano_B == noone {
            cercano_A = noone;
        }
    }
    else {
        cercano_A = noone;
    }
}
// sonido
if cercano_A != noone {
    if gemidos != noone {
        if audio_is_playing(gemidos) {
            exit;
        }
        else {
            gemidos = noone;
        }
    }
    gemidos = audio_play_sound_at(a_sex, x, y, 64, 48, __view_get( e__VW.WView, 0 ) * 0.4, 1, false, 19);
    audio_sound_gain(gemidos, 0.8, 0);
    audio_sound_pitch(gemidos, lerp(1.2, 0.8, pasion));
}
else {
    if gemidos != noone {
        if audio_is_playing(gemidos) {
            audio_stop_sound(gemidos);
        }
        gemidos = noone;
    }
}


