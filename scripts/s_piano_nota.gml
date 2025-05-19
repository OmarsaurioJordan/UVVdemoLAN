// arg0: id del piano que suena
// arg1: id de sonido a ejecutar
// arg2: true si se envia UDP, si es quien ejecuta

with argument0 {
    if reloj_entrenotas == 0 {
        reloj_entrenotas = o_control.entrenotas;
        var asd = audio_play_sound_at(argument1, x, y, 64, 48,
            view_wview[0], 1, false, 15);
        audio_sound_gain(asd, 0.75, 0);
        if argument2 {
            var buf = s_header(6, 3);
            buffer_write(buf, buffer_u16, idweb);
            buffer_write(buf, buffer_u8, argument1);
            s_udp_send(buf, "");
        }
    }
}

