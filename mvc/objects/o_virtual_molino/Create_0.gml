fecha = 0;
reloj_sinc = -1;

opinador = ds_grid_create(o_control.cantidad_opiniones, 3);
ds_grid_clear(opinador, 0); // idweb, fecha, -1,0,1

audiolluvia = audio_play_sound(a_lluvia, 50, true);
audio_sound_gain(audiolluvia, 0, 0);

alarm[0] = 1;


