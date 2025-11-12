depth = -y;
imge = 11;
idweb = s_idweb_loco(x, y);
fecha = 0;
reloj_sinc = -1;

secuencia = ""; // se van acumulando 0.1.2.3.4.5.6...x... (.:vacío, x:todo)
intento = ""; // lo que han undido los usuarios, acumulable

ultima = 0; // ultima secuencia mostrada localmente, length secuencia
repeticion = 0; // ultimo intento mostrado localmente, length intento
reloj_secu = 0; // intervalo entre tramos de la secuencia
nota_anterior = "";

s_secuencia_restart(id, false);

alarm[0] = 1;


