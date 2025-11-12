var au = audio_play_sound_at(a_tiro_golpe, x, y, 64, 48,
    __view_get( e__VW.WView, 0 ) * 1.5, 1, false, 17);
audio_sound_gain(au, 0.7, 0);
var yop = id;
with o_usuario {
    if objeto == 4 and point_distance(x, y, yop.x, yop.y) < 48 {
        objeto = 0;
    }
}
s_tiro_humo(x, y, altura, 18);


