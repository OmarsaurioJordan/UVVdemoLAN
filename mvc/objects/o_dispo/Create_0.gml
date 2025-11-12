depth = -y;
origen = noone;
name = 255;
for (var i = 0; i < 3; i++) {
    vecino[i] = noone; // id instancia vecino
    vecina[i] = 255; // name vecino
}
tipo = 0; // 0:led, 1:buzz, 2:mem, 3:delay, 4:rand, 5:sens, 6:bot, 7:osc,
          // 8:true, 9:false, 10:not, 11:or, 12:and, 13:xor, 14:cable
valor = 0; // segun tipo 0:color, 1:tono, 3:delay, 4:prob, 5:radio, 6:botKe, 7:frec

// funcionamiento
for (var i = 0; i < 3; i++) {
    entrada[i] = 0; // para operadores, alta impedancia azar, reseteable
}
salida = 0; // para salidas, no se resetea
memoria = 0; // cambia dependiendo de la entrada
for (var d = 0; d < 7; d++) {
    delay[d] = 0; // para retardos, cada reseteo inicia con alta impedancia, azar
}
tiempo = 0; // contador para oscila
ante_azar = 0;

alarm[0] = 1;


