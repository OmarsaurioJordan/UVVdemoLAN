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
// crear rejilla de rumbo
var rumbo = argument2;
ds_grid_clear(rumbo, 1000000);
ds_grid_set(rumbo, mx, my, 0);
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
            vp = ds_grid_get(rumbo, vx, vy);
            cp = ds_grid_get(rumbo, mx, my);
            if vz + cp < vp {
                ds_grid_set(rumbo, vx, vy, vz + cp);
                ds_queue_enqueue(lista, vx, vy);
            }
        }
    }
}
ds_grid_set(zona, round(argument0 / cel), round(argument1 / cel), viej);
ds_queue_destroy(lista);
ds_queue_destroy(veci);
// no calcular rejilla final de rumbo

