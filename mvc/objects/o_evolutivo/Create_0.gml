depth = -y;
imge = 9;
idweb = s_idweb_loco(x, y);
fecha = 0;
reloj_sinc = -1;

fuerza_mutacion = 2; // 0-9 cambio azar en un gen
fuerza_recombinacion = 8; // 0-9 cantidad de genes al azar cambiados
densidad_alimento = 5; // 0-9 sera probabilidad de aparecer comida

for (var g = 0; g < 6; g++) { // genes normalizados, para recepcion udp
    // 0: radio vision
    // 1: velocidad andar
    // 2: capacidad energia
    // 3: empatia familiar
    // 4: agresividad no familiar
    // 5: temporizador dormir
    gen[g] = random(1);
}
num_bichos_udp = 0;
num_bichos = 0;
num_genmax = 1;

activo = false;

alarm[0] = 1;


