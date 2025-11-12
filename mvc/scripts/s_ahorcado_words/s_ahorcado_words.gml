// ret: devuelve una lista nueva con las palabras

with o_control {
    ds_list_clear(ahorcado_palabras);
    // importar las palabras originales del archivo
    var ffff = file_text_open_read("ahorcado_words.txt");
    while !file_text_eof(ffff) {
        ds_list_add(ahorcado_palabras, file_text_read_string(ffff));
        if !file_text_eof(ffff) {
            file_text_readln(ffff);
        }
    }
    file_text_close(ffff);
    // agregar palabras de los titulos de diccionarios
    var v;
    with o_diccionario {
        for (var t = 0; t < ds_list_size(titulos); t++) {
            v = ds_list_find_value(titulos, t);
            if string_length(v) >= 5 {
                ds_list_add(o_control.ahorcado_palabras, v);
            }
        }
    }
    // poner todo en minusculas
    for (var i = 0; i < ds_list_size(ahorcado_palabras); i++) {
        ds_list_replace(ahorcado_palabras, i, s_string_letters_lower(
            ds_list_find_value(ahorcado_palabras, i)));
    }
    // prevenir que haya duplicadas o vacias
    var tot = ds_list_size(ahorcado_palabras);
    var v;
    for (var i = tot - 1; i >= 0; i--) {
        v = ds_list_find_value(ahorcado_palabras, i);
        if v == "" {
            ds_list_delete(ahorcado_palabras, i);
            continue;
        }
        if string_length(v) > o_control.limite_ahorcado {
            ds_list_delete(ahorcado_palabras, i);
            continue;
        }
        for (var j = 0; j < i; j++) {
            if ds_list_find_value(ahorcado_palabras, j) == v {
                ds_list_delete(ahorcado_palabras, i);
                break;
            }
        }
    }
    // activar ahorcados vacios
    with o_ahorcado {
        if palabra == "" {
            s_ahorcado_reinicia(id);
        }
    }
}

