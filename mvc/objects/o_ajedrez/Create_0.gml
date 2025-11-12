// configuracion del widget, no afecta al juego ajedrez
depth = -y;
imge = 18;
idweb = s_idweb_loco(x, y);
fecha = 0;
reloj_sinc = -1;

// conteo de fichas eliminadas
muertos[0] = 0;
muertos[1] = 0;

tablero = ds_grid_create(8, 8);
turno = 0; // 0:negras, 1:blancas
// Vacio, Gobernante(ReyNoMove), Rey, Dama,
// Caballo, Peon, Noble(PeonSuper), Torre,
// Alfil, Milicia(PeonNoMove), Fuerte(TorreNoMove)
// ejemplo: C1, caballo blanco
turno_max = 0; // acumulado turnos
var aux;
repeat 32 {
    aux = instance_create(x, y, o_peon);
    aux.origen = id;
}
s_ajedrez_reinicia(id);

miturno = 0; // para dialogo

alarm[0] = 1;


