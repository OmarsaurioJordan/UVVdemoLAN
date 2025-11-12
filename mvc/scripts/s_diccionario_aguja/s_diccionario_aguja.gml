// arg0: id de diccionario para actualizar imagen hoja

with argument0 {
    var txt = ds_list_find_value(fotos, aguja);
    if txt == "" {
        ds_grid_clear(imagen, 0);
        imagen_vacia = true;
    }
    else {
        ds_grid_read(imagen, txt);
        imagen_vacia = false;
    }
}

