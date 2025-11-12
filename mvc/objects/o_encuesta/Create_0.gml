depth = -y;
imge = 22;
idweb = s_idweb_loco(x, y);
fecha = 0;
reloj_sinc = -1;

preguntas = ds_list_create(); // str de preguntas, la primera es titulo
estudiantes = ds_list_create(); // idweb de quienes contestaron
respuestas = ds_list_create(); // listado de las respuestas, numero si-es
genero = 0; // 0:fem, 1:masc

for (var i = 0; i < o_control.encuesta_max; i++) {
    ds_list_add(respuestas, 0);
    grafica[i] = 0;
}
s_respuestas(id);

alarm[0] = 1;


