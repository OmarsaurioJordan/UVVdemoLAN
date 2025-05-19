// arg0: posicion x
// arg1: posicion y
// arg2: calor
// arg3: direccion
// arg4: velocidad
// arg5: tiempo vida particula
// ret: id particula nueva

var xx = random_range(-1, 1);
var yy = random_range(-1, 1);
var res = noone;
with o_particula {
    if !activo {
        activo = true;
        x = argument0 + xx;
        y = argument1 + yy;
        res = id;
        break;
    }
}
if res == noone {
    res = instance_create(argument0 + xx, argument1 + yy, o_particula);
}
with res {
    reloj_fin_max = argument5 + random(argument5);
    reloj_fin = reloj_fin_max;
    z = 64;
    calor = argument2;
    direction = argument3;
    velocity = max(10, argument4);
}
return res;

