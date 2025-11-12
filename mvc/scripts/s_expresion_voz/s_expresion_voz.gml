// arg0: id instancia que suena

with argument0 {
    if bloqueado {
        exit;
    }
    var vz = noone;
    if genero == 0 {
        switch expresion {
            case 1: vz = a_voz_fem_coqueteo; break;
            case 2: vz = a_voz_fem_idea; break;
            case 3: vz = a_voz_fem_si; break;
            case 4: vz = a_voz_fem_no; break;
            case 5: vz = a_voz_fem_insulto; break;
            case 6: vz = a_voz_fem_aqui; break;
            case 7: vz = a_voz_fem_hola; break;
            case 8: vz = a_voz_fem_grito; break;
            case 9: vz = a_voz_fem_ir; break;
            case 10: vz = a_voz_fem_risa; break;
        }
    }
    else {
        switch expresion {
            case 1: vz = a_voz_masc_coqueteo; break;
            case 2: vz = a_voz_masc_idea; break;
            case 3: vz = a_voz_masc_si; break;
            case 4: vz = a_voz_masc_no; break;
            case 5: vz = a_voz_masc_insulto; break;
            case 6: vz = a_voz_masc_aqui; break;
            case 7: vz = a_voz_masc_hola; break;
            case 8: vz = a_voz_masc_grito; break;
            case 9: vz = a_voz_masc_ir; break;
            case 10: vz = a_voz_masc_risa; break;
        }
    }
    if vz != noone {
        var max_dist = __view_get( e__VW.WView, 0 ) * 0.55;
        if vz == a_voz_fem_grito or vz == a_voz_masc_grito {
            max_dist = __view_get( e__VW.WView, 0 ) * 0.85;
        }
        if objeto == 57 or objeto == 58 {
            max_dist *= 1.5;
        }
        var avz = audio_play_sound_at(vz, x, y, 64, 48,
            max_dist, 1, false, 10);
        audio_sound_gain(avz, 0.95, 0);
        var ceresp =  collision_circle(posx, posy, o_control.cerca_especial,
            o_emisora, true, false);
        if ceresp != noone {
            with o_radio {
                avz = audio_play_sound_at(vz, x, y, 64, 48,
                    max_dist * 0.85, 1, false, 12);
                audio_sound_gain(avz, 0.75, 0);
            }
        }
    }
}

