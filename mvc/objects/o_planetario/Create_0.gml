depth = -y;
imge = 2;
idweb = s_idweb_loco(x, y);
fecha = 0;
reloj_sinc = -1;

velocidad = 1;

var aux, rr;
var propvel = 10 / 365;

// mercurio
aux = instance_create(x, y, o_planeta);
aux.origen = id;
aux.centro = id;
aux.tipo = 1;
rr = 36;
aux.radio = rr;
aux.rev_vel = (2 * pi * rr) / (87.6 * propvel);

// venus
aux = instance_create(x, y, o_planeta);
aux.origen = id;
aux.centro = id;
aux.tipo = 2;
rr += 12;
aux.radio = rr;
aux.rev_vel = (2 * pi * rr) / (226.3 * propvel);

// tierra
aux = instance_create(x, y, o_planeta);
aux.origen = id;
aux.centro = id;
aux.tipo = 3;
rr += 12;
aux.radio = rr;
aux.rev_vel = (2 * pi * rr) / (365.25 * propvel);
var tl = aux;

// luna
aux = instance_create(x, y, o_planeta);
aux.origen = id;
aux.centro = tl;
aux.tipo = 0;
tl = 8;
aux.radio = tl;
aux.rev_vel = (2 * pi * tl) / (27.32 * propvel);

// marte
aux = instance_create(x, y, o_planeta);
aux.origen = id;
aux.centro = id;
aux.tipo = 4;
rr += 12;
aux.radio = rr;
aux.rev_vel = (2 * pi * rr) / (686.2 * propvel);

// jupiter
aux = instance_create(x, y, o_planeta);
aux.origen = id;
aux.centro = id;
aux.tipo = 5;
rr += 16;
aux.radio = rr;
aux.rev_vel = (2 * pi * rr) / (4328.9 * propvel);

// saturno
aux = instance_create(x, y, o_planeta);
aux.origen = id;
aux.centro = id;
aux.tipo = 6;
rr += 16;
aux.radio = rr;
aux.rev_vel = (2 * pi * rr) / (10752.9 * propvel);

// urano
aux = instance_create(x, y, o_planeta);
aux.origen = id;
aux.centro = id;
aux.tipo = 7;
rr += 16;
aux.radio = rr;
aux.rev_vel = (2 * pi * rr) / (30663.65 * propvel);

// neptuno
aux = instance_create(x, y, o_planeta);
aux.origen = id;
aux.centro = id;
aux.tipo = 8;
rr += 14;
aux.radio = rr;
aux.rev_vel = (2 * pi * rr) / (60152 * propvel);

// pluton
aux = instance_create(x, y, o_planeta);
aux.origen = id;
aux.centro = id;
aux.tipo = 9;
rr += 12;
aux.radio = rr;
aux.rev_vel = (2 * pi * rr) / (90410.5 * propvel);

alarm[0] = 1;


