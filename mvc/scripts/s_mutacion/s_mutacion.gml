// id bicho de origen
// id bicho que sera mutacion del primero

var mut = o_evolutivo.fuerza_mutacion / 9;
var recomb = o_evolutivo.fuerza_recombinacion / 9;
for (var g = 0; g < 6; g++) {
    if random(1) < recomb {
        argument1.gen[g] = clamp(argument0.gen[g] + random_range(-mut, mut), 0, 1);
    }
    else {
        argument1.gen[g] = argument0.gen[g];
    }
}
s_fenotipo(argument1);

