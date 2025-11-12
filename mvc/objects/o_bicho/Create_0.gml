madre = noone; // quien lo creo
for (var g = 0; g < 6; g++) { // genes normalizados
    // 0: radio vision
    // 1: velocidad andar
    // 2: capacidad energia
    // 3: empatia familiar
    // 4: agresividad no familiar
    // 5: temporizador dormir
    gen[g] = random(1);
}
s_fenotipo(id);
energia = fenotipo[2] / 2;
direction = random(360);
mx = x;
my = y;
objetivo = noone;
dormir = random(o_control.bicho_dormir); // segundos quietud
activo = true;
social = noone;
blanco = noone;
levantado = true;

// estadisticas
generacion = 1; // eslabon en cadena familiar
edad = 0; // segundos vida
hijos = 0; // reproducciones exitosas

s_anima_ini(id, 2, false, false);


