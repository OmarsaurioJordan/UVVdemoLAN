grupo = 0; // 0:rojo, 1:azul, 2:amarillo
origen = noone; // id quien lo creo
reloj_fin = random_range(1.5, 1.6);

var au = audio_play_sound_at(a_bala_go, x, y, 64, 48,
    __view_get( e__VW.WView, 0 ) * 0.8, 1, false, 7);
audio_sound_gain(au, 0.8, 0);


