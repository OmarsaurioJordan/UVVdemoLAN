depth = -y;
imge = 0;
idweb = s_idweb_loco(x, y);
fecha = 0;
reloj_sinc = -1;

// constantes
radio = 100; // alcance particulas
transmision = 0.5; // cambio de calor con baculo
centrifugo = 75; // aceleracion angular basica para girar particulas centrifugamente
decaimiento = 3; // multiplo de disminucion de tiempo particulas en borde de radio
friccion = 0.999; // disminucion velocidad particulas
veloci_ini = 75; // velocidad inicial base de particulas
vida_particula = 6; // segundos de existencia, al azar el doble
reloj_parti_max = 0.05; // tiempo base para creacion de particulas
repulsion = 100; // velocidad colision con otras particulas
atract = 200; // velocidad de atraccion o repulsion

// variables
activo = false; // crear particulas
calor_ini = 2; // calor inicial 0:frio, 1:caliente, 2:medio, 3:azar
cadencia = 1; // cantidad de creacion de particulas 0,1,2,3:crear
girar = 2; // potencia centrifugo 0:nada, 1,2,3:acelerado
direccional = 360; // arco aleatorio para direccion inicial de particulas 0,45,90,180,360
disparado = 1; // potencia de veloci_ini, 0:nada, 1,2,3:velocidad

// funcionamiento
reloj_parti = 0;
sonido = noone;

alarm[0] = 1;


