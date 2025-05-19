// arg0: posicion x
// arg1: posicion y
// arg2: id de sonido
// arg3: true si enviar por udp

var asd;
switch argument2 {
    case a_evo_empatia:
    case a_evo_golpe:
    case a_evo_reproduccion:
        asd = audio_play_sound_at(argument2, argument0, argument1, 64, 48,
            view_wview[0] * 0.8, 1, false, 1); audio_sound_gain(asd, 0.4, 0); break;
    case a_fracaso:
    case a_chekpoint:
        asd = audio_play_sound_at(argument2, argument0, argument1, 64, 48,
            view_wview[0] * 0.5, 1, false, 30); audio_sound_gain(asd, 0.6, 0); break;
    case a_silvato:
        asd = audio_play_sound_at(argument2, argument0, argument1, 64, 48,
            view_wview[0], 1, false, 18); audio_sound_gain(asd, 0.7, 0); break;
    case a_monedaso:
        asd = audio_play_sound_at(argument2, argument0, argument1, 64, 48,
            view_wview[0] * 0.5, 1, false, 18); audio_sound_gain(asd, 0.7, 0); break;
    case a_camara:
    case a_telefono:
        asd = audio_play_sound_at(argument2, argument0, argument1, 64, 48,
            view_wview[0] * 0.6, 1, false, 17); audio_sound_gain(asd, 0.75, 0); break;
    case a_guitarra:
    case a_electrica:
    case a_tambor:
    case a_tambuuum:
    case a_violin:
    case a_flauta:
    case a_trombon:
    case a_trompeta:
    case a_bajo:
    case a_banjo:
    case a_platillo:
    case a_piano:
    case a_cacerola:
        asd = audio_play_sound_at(argument2, argument0, argument1, 64, 48,
            view_wview[0] * 0.7, 1, false, 9); audio_sound_gain(asd, 0.95, 0); break;
    case a_perro:
    case a_gato:
    case a_vaca:
    case a_loro:
    case a_bebe:
    case a_cerdo:
        asd = audio_play_sound_at(argument2, argument0, argument1, 64, 48,
            view_wview[0] * 0.55, 1, false, 10); audio_sound_gain(asd, 0.9, 0); break;
    case a_pistola:
    case a_metralla:
    case a_escopeta:
    case a_bazooka:
    case a_sniper:
        asd = audio_play_sound_at(argument2, argument0, argument1, 64, 48,
            view_wview[0] * 0.75, 1, false, 8); audio_sound_gain(asd, 0.9, 0); break;
    case a_rocket:
        asd = audio_play_sound_at(argument2, argument0, argument1, 64, 48,
            view_wview[0] * 0.8, 1, false, 19); audio_sound_gain(asd, 0.9, 0); break;
    case a_explosion:
        asd = audio_play_sound_at(argument2, argument0, argument1, 64, 48,
            view_wview[0] * 0.9, 1, false, 8); audio_sound_gain(asd, 0.75, 0);
        s_tiro_humo(argument0, argument1, 48, 25);
        break;
    case a_flecha:
    case a_espadazo:
    case a_latigo:
    case a_motocierra:
        asd = audio_play_sound_at(argument2, argument0, argument1, 64, 48,
            view_wview[0] * 0.55, 1, false, 8); audio_sound_gain(asd, 0.9, 0); break;
}
if argument3 {
    var buf = s_header(35, 6);
    buffer_write(buf, buffer_u16, argument0);
    buffer_write(buf, buffer_u16, argument1);
    buffer_write(buf, buffer_u16, argument2);
    s_udp_send(buf, "");
}

