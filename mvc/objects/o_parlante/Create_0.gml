depth = -y;
imge = 5;
idweb = s_idweb_loco(x, y);
fecha = 0;
reloj_sinc = -1;
turno_sinc = 0;

archivo = ds_list_create();
mute = 1; // 0:suena, 1:silencio

stream = noone;
stream_play = noone;
reloj_sonar = o_control.relojini_parlante + random(1);
hubo_cambio = false;

s_anima_ini(id, 0, true, false);

alarm[0] = 1;


