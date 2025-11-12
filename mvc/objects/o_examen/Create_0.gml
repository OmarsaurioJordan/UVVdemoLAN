depth = -y;
imge = 21;
idweb = s_idweb_loco(x, y);
fecha = 0;
reloj_sinc = -1;

preguntas = ds_list_create(); // str de preguntas, la primera es titulo
estudiantes = ds_list_create(); // idweb de quienes contestaron
notas = ds_list_create(); // notas de quienes contestaron, numero de aciertos

for (var i = 0; i < 5; i++) {
    grafica[i] = 0;
}
s_notas(id);

alarm[0] = 1;


