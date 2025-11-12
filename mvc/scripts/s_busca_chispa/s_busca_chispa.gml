// ret: id de chispa a usar

var res = noone;
with o_chispa {
    if !activo {
        activo = true;
        res = id;
        break;
    }
}
if res == noone {
    res = instance_create(0, 0, o_chispa);
}
return res;

