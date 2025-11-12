// arg0: id de grid
// arg1: valor a ser comparado para sumar
// arg2: true igual, false diferente
// ret: suma de valores arg1

var res = 0;
if argument2 {
    for (var w = 0; w < ds_grid_width(argument0); w++) {
        for (var h = 0; h < ds_grid_height(argument0); h++) {
            if ds_grid_get(argument0, w, h) == argument1 {
                res++;
            }
        }
    }
}
else {
    for (var w = 0; w < ds_grid_width(argument0); w++) {
        for (var h = 0; h < ds_grid_height(argument0); h++) {
            if ds_grid_get(argument0, w, h) != argument1 {
                res++;
            }
        }
    }
}
return res;

