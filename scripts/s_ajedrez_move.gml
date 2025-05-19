// arg0: id de ajedrez
// arg1: posicion w inicial
// arg2: posicion h inicial
// arg3: posicion w final
// arg4: posicion h final
// arg5: true si es oficial, false intento de mover
// ret: true si logro mover
// nota: hacer actualizacion web

var wi = argument1;
var hi = argument2;
var wf = argument3;
var hf = argument4;
with argument0 {
    
    // obtener la pieza a mover
    var tur = string(turno);
    var pieza = ds_grid_get(tablero, wi, hi);
    if pieza == "v" {
        return false; // selecciono espacio vacio
    }
    if wi == wf and hi == hf {
        return false; // negado por quietud
    }
    
    // manejo manual
    if argument5 {
        // guardar estado anterior, por si jugada acaba en hacke
        var tablero_ant = ds_grid_write(tablero);
        
        // reglas manuales
        if string_char_at(pieza, 2) != tur {
            return false; // la pieza es del otro bando
        }
    }
    else {
        if tur == "0" {
            tur = "1";
        }
        else {
            tur = "0";
        }
    }
    
    // ejecutar movimientos segun ficha
    var movio = "";
    var wv = wf - wi;
    var hv = hf - hi;
    var wn = wi;
    var hn = hi;
    switch string_char_at(pieza, 1) {
        
        case "g": case "r": // rey
            if abs(wv) <= 1 and abs(hv) <= 1 {
                var otr = ds_grid_get(tablero, wf, hf);
                if otr != "v" {
                    if string_char_at(otr, 2) == tur {
                        return false; // no puede comer aliado
                    }
                    else {
                        movio = "r";
                    }
                }
                else {
                    movio = "r";
                }
            }
            break;
        
        case "d": case "n": // dama
            if (wv == 0 or hv == 0) or (abs(wv) == abs(hv)) { // cruz o diagonal
                while wn != wf or hn != hf {
                    wn += clamp(wv, -1, 1);
                    hn += clamp(hv, -1, 1);
                    if wn != wf and hn != hf { // un paso libre
                        if ds_grid_get(tablero, wn, hn) != "v" {
                            return false; // obstaculo en el camino
                        }
                    }
                    else { // llego al final
                        var otr = ds_grid_get(tablero, wn, hn);
                        if otr != "v" {
                            if string_char_at(otr, 2) == tur {
                                return false; // no puede comer aliado
                            }
                            else {
                                movio = string_char_at(pieza, 1);
                            }
                        }
                        else {
                            movio = string_char_at(pieza, 1);
                        }
                    }
                }
            }
            break;
        
        case "f": case "t": // torre
            if wv == 0 or hv == 0 { // cruz
                while wn != wf or hn != hf {
                    wn += clamp(wv, -1, 1);
                    hn += clamp(hv, -1, 1);
                    if wn != wf and hn != hf { // un paso libre
                        if ds_grid_get(tablero, wn, hn) != "v" {
                            return false; // obstaculo en el camino
                        }
                    }
                    else { // llego al final
                        var otr = ds_grid_get(tablero, wn, hn);
                        if otr != "v" {
                            if string_char_at(otr, 2) == tur {
                                return false; // no puede comer aliado
                            }
                            else {
                                movio = "t";
                            }
                        }
                        else {
                            movio = "t";
                        }
                    }
                }
            }
            break;
        
        case "c": // caballo
            if (abs(wv) == 2 and abs(hv) == 1) or (abs(wv) == 1 and abs(hv) == 2) {
                var otr = ds_grid_get(tablero, wf, hf);
                if otr != "v" {
                    if string_char_at(otr, 2) == tur {
                        return false; // no puede comer aliado
                    }
                    else {
                        movio = "c";
                    }
                }
                else {
                    movio = "c";
                }
            }
            break;
        
        case "a": // alfil
            if abs(wv) == abs(hv) { // diagonal
                while wn != wf or hn != hf {
                    wn += clamp(wv, -1, 1);
                    hn += clamp(hv, -1, 1);
                    if wn != wf and hn != hf { // un paso libre
                        if ds_grid_get(tablero, wn, hn) != "v" {
                            return false; // obstaculo en el camino
                        }
                    }
                    else { // llego al final
                        var otr = ds_grid_get(tablero, wn, hn);
                        if otr != "v" {
                            if string_char_at(otr, 2) == tur {
                                return false; // no puede comer aliado
                            }
                            else {
                                movio = "a";
                            }
                        }
                        else {
                            movio = "a";
                        }
                    }
                }
            }
            break;
        
        case "m": // peon inicial
            var refl = -sign(turno - 0.5);
            if hf == hi + refl { // andar un paso al frente
                if wv == 0 { // linea recta al frente
                    if ds_grid_get(tablero, wf, hf) != "v" {
                        return false; // no puede comer al frente
                    }
                    else {
                        movio = "p";
                    }
                }
                else if abs(wv) == 1 {
                    var otr = ds_grid_get(tablero, wf, hf);
                    if otr != "v" {
                        if string_char_at(otr, 2) == tur {
                            return false; // no puede comer aliado
                        }
                        else {
                            movio = "p";
                        }
                    }
                    else {
                        return false; // solo mueve a los lados para comer
                    }
                }
            }
            else if hf == hi + refl * 2 and wv == 0 { // paso doble al frente
                if ds_grid_get(tablero, wf, hi + refl) != "v" {
                    return false; // obstaculo en el camino
                }
                if ds_grid_get(tablero, wf, hf) != "v" {
                    return false; // no puede comer al frente
                }
                else {
                    movio = "p";
                }
            }
            break;
        
        case "p": // peon
            var refl = -sign(turno - 0.5);
            if hf == hi + refl { // andar un paso al frente
                if wv == 0 { // linea recta al frente
                    if ds_grid_get(tablero, wf, hf) != "v" {
                        return false; // no puede comer al frente
                    }
                    else {
                        movio = "p";
                    }
                }
                else if abs(wv) == 1 {
                    var otr = ds_grid_get(tablero, wf, hf);
                    if otr != "v" {
                        if string_char_at(otr, 2) == tur {
                            return false; // no puede comer aliado
                        }
                        else {
                            movio = "p";
                        }
                    }
                    else {
                        return false; // solo mueve a los lados para comer
                    }
                }
            }
            // ver si transformarse
            if movio == "p" {
                if turno == 0 and hf == 7 {
                    movio = "n";
                }
                else if turno == 1 and hf == 0 {
                    movio = "n";
                }
            }
            break;
    }
    
    // hacer reemplazo y eliminacion
    if movio != "" {
        if !argument5 {
            return true;
        }
        ds_grid_set(tablero, wi, hi, "v");
        ds_grid_set(tablero, wf, hf, movio + tur);
    }
    else {
        return false; // no hay accion
    }
    
    // verificar estado de hacke
    if s_ajedrez_hacke(id) {
        ds_grid_read(tablero, tablero_ant);
        return false; // no valido movimiento que deje en hacke
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
return true;

