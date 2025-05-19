// arg0: posicion x
// arg1: posicion y
// arg2: altura
// arg3: ind sprite d_piezas

var aux, dd, ll;
var rp;
switch argument3 {
    case 25: rp = 30; break;
    case 26: case 27: rp = 1; break;
    default: rp = 10; break;
}
repeat rp {
    dd = random(360);
    switch argument3 {
        case 25: ll = 108 * power(random(1), 0.4);; break;
        case 26: ll = random(7); break;
        case 27: ll = 12 * power(random(1), 0.4); break;
        default: ll = 36 * power(random(1), 0.4); break;
    }
    aux = instance_create(
        argument0 + lengthdir_x(ll, dd),
        argument1 + lengthdir_y(ll, dd),
        o_tiro_humo);
    switch argument3 {
        case 26: aux.altura = argument2 + random_range(-7, 7); break;
        default: aux.altura = random_range(max(0, argument2 - 40), argument2 + 40); break;
    }
    aux.imagen = argument3;
}

