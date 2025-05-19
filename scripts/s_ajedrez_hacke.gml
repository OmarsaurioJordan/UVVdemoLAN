// arg0: id de ajedrez
// ret: true si esta en hacke el rey de turno actual

var res = false;
with argument0 {
    
    // buscar al rey
    var wr = -1;
    var hr = -1;
    var tur = string(turno);
    var pix, gru;
    for (var h = 0; h < 8; h++) {
        for (var w = 0; w < 8; w++) {
            pix = ds_grid_get(tablero, w, h);
            if pix != "v" {
                gru = string_char_at(pix, 2);
                pix = string_char_at(pix, 1);
                if (pix == "r" or pix == "g") and gru == tur {
                    wr = w; hr = h;
                    break;
                }
            }
        }
        if wr != -1 and hr != -1 {
            break;
        }
    }
    
    // buscar quien puede matar al rey
    if wr != -1 and hr != -1 {
        for (var h = 0; h < 8; h++) {
            for (var w = 0; w < 8; w++) {
                pix = ds_grid_get(tablero, w, h);
                if pix != "v" {
                    if string_char_at(pix, 2) != tur {
                        res = s_ajedrez_move(argument0, w, h, wr, hr, false);
                        if res {
                            break;
                        }
                    }
                }
            }
            if res {
                break;
            }
        }
    }
}
return res;

