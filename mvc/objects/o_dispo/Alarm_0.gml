/// @description  buscar ids
var yop = id;
var lim = 0;
switch tipo {
    case 0: lim = 1; break;
    case 1: lim = 1; break;
    case 2: lim = 3; break;
    case 3: lim = 2; break;
    case 4: lim = 1; break;
    case 5: lim = 1; break;
    case 6: lim = 1; break;
    case 7: lim = 1; break;
    case 8: lim = 1; break;
    case 9: lim = 1; break;
    case 10: lim = 2; break;
    case 11: lim = 3; break;
    case 12: lim = 3; break;
    case 13: lim = 3; break;
    case 14: lim = 3; break;
}
for (var i = 0; i < lim; i++) {
    vecino[i] = noone;
    with o_dispo {
        if id != yop and name == yop.vecina[i] {
            yop.vecino[i] = id;
            break;
        }
    }
}
origen.nodos = 0;
with o_dispo {
    if origen == yop.origen {
        yop.origen.nodos++;
    }
}


