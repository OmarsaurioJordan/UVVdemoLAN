// arg0: id o_parlante a ser activado
// ret: true si logro sonar

var res = false;
var radiosonido = __view_get( e__VW.WView, 0 );
with argument0 {
    if hubo_cambio {
        hubo_cambio = false;
        s_limpia_parlante(id, false);
        if file_exists("ogg/parlante" + string(idweb) + ".ogg") {
            file_delete("ogg/parlante" + string(idweb) + ".ogg");
        }
        break;
    }
    if mute == 0 { // sonido
        if stream_play == noone {
            if stream == noone {
                if file_exists("ogg/parlante" + string(idweb) + ".ogg") {
                    stream = audio_create_stream("ogg/parlante" + string(idweb) + ".ogg");
                    reloj_sonar = 1;
                }
                else if point_distance(x, y, o_control.mipropio.x, o_control.mipropio.y) < radiosonido + 200 and
                        s_rearma_archivo(archivo, "ogg/parlante" + string(idweb) + ".ogg") {
                    reloj_sonar = 1;
                }
            }
            else {
                stream_play = audio_play_sound_at(stream, x, y, 64, 48,
                    radiosonido, 1.5, true, 20);
                audio_sound_gain(stream_play, 0.75, 0);
                res = true;
            }
        }
    }
    else { // silencio
        s_limpia_parlante(id, false);
    }
}
return res;

