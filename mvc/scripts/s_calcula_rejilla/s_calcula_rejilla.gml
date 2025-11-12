// arg0: destino x
// arg1: destino y
// arg2: id grid que hace de camino final

// datos generales de la rejilla
var zona = o_control.zona;
var cel = o_control.nav_celda;
var wmax = ceil(room_width / cel);
var hmax = ceil(room_height / cel);
var mx = round(argument0 / cel);
var my = round(argument1 / cel);
// crear rejilla de peso
var peso = ds_grid_create(wmax, hmax);
ds_grid_clear(peso, 1000000);
ds_grid_set(peso, mx, my, 0);
// ejecutar ciclo de calculos
var viej = ds_grid_get(zona, mx, my);
ds_grid_set(zona, mx, my, 0);
var lista = ds_queue_create();
ds_queue_enqueue(lista, mx, my);
var vx, vy, vz, vp, cp;
var veci = ds_queue_create();
while !ds_queue_empty(lista) {
    mx = ds_queue_dequeue(lista);
    my = ds_queue_dequeue(lista);
    if mx > 0 {
        ds_queue_enqueue(veci, mx - 1, my);
    }
    if mx < wmax - 1 {
        ds_queue_enqueue(veci, mx + 1, my);
    }
    if my > 0 {
        ds_queue_enqueue(veci, mx, my - 1);
    }
    if my < hmax - 1 {
        ds_queue_enqueue(veci, mx, my + 1);
    }
    while !ds_queue_empty(veci) {
        vx = ds_queue_dequeue(veci);
        vy = ds_queue_dequeue(veci);
        vz = ds_grid_get(zona, vx, vy);
        if vz != -1 {
            vp = ds_grid_get(peso, vx, vy);
            cp = ds_grid_get(peso, mx, my);
            if vz + cp < vp {
                ds_grid_set(peso, vx, vy, vz + cp);
                ds_queue_enqueue(lista, vx, vy);
            }
        }
    }
}
ds_grid_set(zona, round(argument0 / cel), round(argument1 / cel), viej);
ds_queue_destroy(lista);
ds_queue_destroy(veci);
// calcular rejilla final de rumbo
var rumbo = argument2;
ds_grid_clear(rumbo, -1);
var menor, xx, yy;
for (var w = 0; w < wmax; w++) {
    for (var h = 0; h < hmax; h++) {
        menor = ds_grid_get_min(peso, max(0, w - 1), max(0, h - 1),
            min(wmax - 1, w + 1), min(hmax - 1, h + 1));
        if menor != 1000000 {
            xx = ds_grid_value_x(peso, max(0, w - 1), max(0, h - 1),
                min(wmax - 1, w + 1), min(hmax - 1, h + 1), menor);
            yy = ds_grid_value_y(peso, max(0, w - 1), max(0, h - 1),
                min(wmax - 1, w + 1), min(hmax - 1, h + 1), menor);
            ds_grid_set(rumbo, w, h, point_direction(w, h, xx, yy));
        }
    }
}
ds_grid_destroy(peso);

