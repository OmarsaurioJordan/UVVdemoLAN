// arg0: id de ahorcado

with argument0 {
    palabra = ds_list_find_value(o_control.ahorcado_palabras,
        irandom(ds_list_size(o_control.ahorcado_palabras) - 1));
    adivinada = string_repeat("-", string_length(palabra));
    vidas = 6;
    historial = "";
}

