// arg0: id ajedrez que ordena sus fichas

with argument0 {
    muertos[0] = 16;
    muertos[1] = 16;
    var list = ds_queue_create();
    // peon realmente es el objeto que representa a todas las fichas
    with o_peon {
        if origen == argument0 {
            ds_queue_enqueue(list, id);
            tipo = -1;
        }
    }
    var pix, ccc, aux;
    var ca = o_control.celda_ajedrez; // talla celda pixeles
    var desf = 0;
    for (var h = 0; h < 8; h++) {
        for (var w = 0; w < 8; w++) {
            pix = ds_grid_get(tablero, w, h);
            if pix != "v" {
                // desfase blancas y negras en tira de sprites, 7 imagenes
                ccc = real(string_char_at(pix, 2)) * 7;
                // conteo de fichas eliminadas, como esta viva resta
                muertos[min(1, ccc)]--;
                // asignarle a un objeto peon su apariencia
                aux = ds_queue_dequeue(list);
                switch string_char_at(pix, 1) {
                    case "g": case "r": aux.tipo = 0 + ccc; break;
                    case "d": aux.tipo = 1 + ccc; break;
                    case "f": case "t": aux.tipo = 2 + ccc; break;
                    case "c": aux.tipo = 3 + ccc; break;
                    case "a": aux.tipo = 4 + ccc; break;
                    case "m": case "p": aux.tipo = 5 + ccc; break;
                    case "n": aux.tipo = 6 + ccc; break;
                }
                // asignarle a un objeto peon su posicion
                aux.x = x - 4 * ca + w * ca + desf;
                aux.y = y + 24 + h * ca * 0.75;
                aux.depth = -aux.y;
            }
        }
        // para que se pinte como corrido en x, no cuadrado
        desf += ca * 0.2;
    }
    ds_queue_destroy(list);
}

