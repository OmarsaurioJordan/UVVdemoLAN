// arg0: id de grid a poner barco
// arg1: numero de espacios ocupados

var lad = ds_grid_width(argument0);
var tot = ds_grid_get_sum(argument0, 0, 0, lad - 1, lad - 1);
var copy = ds_grid_create(lad, lad);
var xx, yy, sum;
do {
    ds_grid_copy(copy, argument0);
    xx = irandom(lad - 1);
    yy = irandom(lad - 1);
    if irandom(1) == 0 { // vertical
        for (var i = 0; i < argument1; i++) {
            if yy + i >= lad {
                break;
            }
            ds_grid_set(copy, xx, yy + i, 1);
        }
    }
    else { // horizontal
        for (var i = 0; i < argument1; i++) {
            if xx + i >= lad {
                break;
            }
            ds_grid_set(copy, xx + i, yy, 1);
        }
    }
    sum = ds_grid_get_sum(copy, 0, 0, lad - 1, lad - 1);
}
until sum - tot == argument1;
ds_grid_copy(argument0, copy);
ds_grid_destroy(copy);

