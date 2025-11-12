x += random_range(-3, 3);
y += random_range(1, 4);
depth = -y;
direction = random(360);
reloj_fin_max = random_range(5, 10);
reloj_fin = reloj_fin_max;
altura = 53;

var asd = audio_play_sound_at(a_tos, x, y, 53, 48,
    __view_get( e__VW.WView, 0 ) * 0.6, 1, false, 1);
audio_sound_gain(asd, 0.75, 0);


