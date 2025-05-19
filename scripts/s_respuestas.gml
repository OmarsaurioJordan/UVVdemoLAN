// arg0: id de instancia encuesta

with argument0 {
    var tot = ds_list_size(estudiantes);
    if tot != 0 {
        for (var i = 0; i < o_control.encuesta_max; i++) {
            grafica[i] = ds_list_find_value(respuestas, i) / tot;
        }
    }
    else {
        for (var i = 0; i < o_control.encuesta_max; i++) {
            grafica[i] = 0;
        }
    }
}

