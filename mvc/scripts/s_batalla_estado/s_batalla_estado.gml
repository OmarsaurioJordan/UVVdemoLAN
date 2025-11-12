// ret: 0 no iniciado, 1 en juego, 2 finalizado

var res = 1;
var sum = 0;
var okas;
var lad = ds_grid_width(o_batalla.tiros);
with o_batalla {
    sum += ds_grid_get_sum(tiros, 0, 0, lad - 1, lad - 1);
    okas = 0;
    for (var w = 0; w < lad; w++) {
        for (var h = 0; h < lad; h++) {
            if ds_grid_get(tiros, w, h) == 2 {
                okas++;
            }
        }
    }
    if okas == 16 {
        return 2;
    }
}
if sum == 0 {
    res = 0;
}
return res;

