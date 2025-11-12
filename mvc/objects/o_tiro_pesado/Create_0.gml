origen = noone; // id quien lo creo
velx = 0;
vely = 0;
altura = 82;

var au = audio_play_sound_at(a_tiro_parabolico, x, y, 64, 48,
    __view_get( e__VW.WView, 0 ) * 1.5, 1, false, 17);
audio_sound_gain(au, 0.9, 0);
s_tiro_humo(x, y, altura, 18);


