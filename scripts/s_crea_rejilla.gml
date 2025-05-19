// ret: id de grid para obstaculos

// datos generales de la rejilla
var cel = o_control.nav_celda;
var wmax = ceil(room_width / cel);
var hmax = ceil(room_height / cel);
// crear rejilla especial para poner instancias solidas
var motg = mp_grid_create(0, 0, wmax, hmax, cel, cel);
with o_bloque {
    mp_grid_add_instances(motg, id, true);
}
// crear rejilla oficial, llenarla de pasto
var zona = ds_grid_create(wmax, hmax);
ds_grid_clear(zona, 2);
// poner calzadas, mas facil de andar que el pasto
var rr = 32 / cel;
for (var i = 0; i < array_height_2d(baldozall); i++) {
    if baldozall[i, 2] != 2 {
        ds_grid_set_disk(zona, round(baldozall[i, 0] / cel),
            round(baldozall[i, 1] / cel), rr, 1);
    }
}
// poner influencia de objetos solidos, traidos de la otra rejilla
for (var h = 0; h < hmax; h++) {
    for (var w = 0; w < wmax; w++) {
        if mp_grid_get_cell(motg, w, h) == -1 {
            ds_grid_add_region(zona, w - 1, h - 1, w + 1, h + 1, 1);
        }
    }
}
for (var h = 0; h < hmax; h++) {
    for (var w = 0; w < wmax; w++) {
        ds_grid_set(zona, w, h, min(3, ds_grid_get(zona, w, h)));
    }
}
// poner el agua, es mas duro andar por ahi
rr = o_control.radio_zona / cel;
with o_pnt_lago1 {
    ds_grid_set_disk(zona, round(x / cel),
        round(y / cel), rr, 3);
}
with o_pnt_lago2 {
    ds_grid_set_disk(zona, round(x / cel),
        round(y / cel), rr, 3);
}
with o_pnt_piscina {
    ds_grid_set_disk(zona, round(x / cel),
        round(y / cel), rr, 3);
}
// poner los objetos solidos, traidos de la otra rejilla
for (var h = 0; h < hmax; h++) {
    for (var w = 0; w < wmax; w++) {
        if mp_grid_get_cell(motg, w, h) == -1 {
            ds_grid_set(zona, w, h, -1);
        }
    }
}
// finalizar
mp_grid_destroy(motg);
return zona;

