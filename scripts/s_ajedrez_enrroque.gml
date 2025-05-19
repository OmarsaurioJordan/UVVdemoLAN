// arg0: id de ajedrez
// arg1: true si derecha, false izquierda
// nota: hacer actualizacion web

with argument0 {
    
    // verificar si esta en hacke
    if s_ajedrez_hacke(id) {
        exit; // no es posible si esta en hacke
    }
    
    // ver la fila en la que sucede el enroque
    var tur = string(turno);
    var yy = 0;
    if tur == "1" {
        yy = 7;
    }
    
    // guardar estado anterior, por si jugada acaba en hacke
    var tablero_ant = ds_grid_write(tablero);
    
    // enroque largo
    if !argument1 and
            ds_grid_get(tablero, 0, yy) == "f" + tur and
            ds_grid_get(tablero, 1, yy) == "v" and
            ds_grid_get(tablero, 2, yy) == "v" and
            ds_grid_get(tablero, 3, yy) == "v" and
            ds_grid_get(tablero, 4, yy) == "g" + tur {
        ds_grid_set(tablero, 0, yy, "v");
        ds_grid_set(tablero, 3, yy, "t" + tur);
        ds_grid_set(tablero, 4, yy, "v");
        ds_grid_set(tablero, 2, yy, "r" + tur);
    }
    // enroque corto
    else if argument1 and
            ds_grid_get(tablero, 7, yy) == "f" + tur and
            ds_grid_get(tablero, 6, yy) == "v" and
            ds_grid_get(tablero, 5, yy) == "v" and
            ds_grid_get(tablero, 4, yy) == "g" + tur {
        ds_grid_set(tablero, 7, yy, "v");
        ds_grid_set(tablero, 5, yy, "t" + tur);
        ds_grid_set(tablero, 4, yy, "v");
        ds_grid_set(tablero, 6, yy, "r" + tur);
    }
    
    // verificar estado de hacke
    if s_ajedrez_hacke(id) {
        ds_grid_read(tablero, tablero_ant);
        exit; // no valido movimiento que deje en hacke
    }
    
    // hacer retoques finales
    if turno == 0 {
        turno = 1;
    }
    else {
        turno = 0;
    }
    turno_max++;
    s_ajedrez_fichas(id);
    fecha = s_current_time();
    reloj_sinc = 0;
}

