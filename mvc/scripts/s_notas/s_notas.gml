// arg0: id de instancia examen

with argument0 {
    for (var i = 0; i < 5; i++) {
        grafica[i] = 0;
    }
    var tot = ds_list_size(notas);
    if tot != 0 {
        var pre = ds_list_size(preguntas) - 1;
        var n;
        for (var i = 0; i < tot; i++) {
            n = round((ds_list_find_value(notas, i) / pre) * 50) / 10;
            if n < 2 {
                grafica[0]++;
            }
            else if n < 3 {
                grafica[1]++;
            }
            else if n < 3.666 {
                grafica[2]++;
            }
            else if n < 4.333 {
                grafica[3]++;
            }
            else {
                grafica[4]++;
            }
        }
        for (var i = 0; i < 5; i++) {
            grafica[i] /= tot;
        }
    }
}

