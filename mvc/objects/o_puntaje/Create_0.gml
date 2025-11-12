depth = -y;
imge = 1;
idweb = s_idweb_loco(x, y);
fecha = 0;
reloj_delta = 0; // para complementar fecha
reloj_sinc = 1;

puntos[0] = 0;
puntos[1] = 0;
reloj_juego = 0; // 0:desactivado, duracion de partido
reloj_balon = 0; // 0:desactivado, para aparecer el balon
enjuego = false; // true si esta en partido

// constantes
friccion = 0.99; // para detener balon
patada = 200; // velocidad de balon pateado
bisco = 45; // descache al azar al dirigir balon
puntos_futbol = 5; // maximos goles para ganar
reloj_juego_max = 90; // segundos de partido total

alarm[0] = 1;


