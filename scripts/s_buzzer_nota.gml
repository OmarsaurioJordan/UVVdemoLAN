// arg0: posicion x
// arg1: posicion y
// arg2: id de sonido a ejecutar
// arg3: true si se envia UDP, si es quien ejecuta

var asd = audio_play_sound_at(argument2, argument0, argument1, 64, 48,
    view_wview[0] * 0.7, 1, false, 13);
audio_sound_gain(asd, 0.75, 0);
if argument3 {
    var buf = s_header(30, 5);
    buffer_write(buf, buffer_u16, argument0);
    buffer_write(buf, buffer_u16, argument1);
    buffer_write(buf, buffer_u8, argument2);
    s_udp_send(buf, "");
}

