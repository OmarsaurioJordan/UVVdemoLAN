// arg0: id de presentacion para actualizar imagen

with argument0 {
    if aguja == 255 {
        ds_grid_clear(imagen, 0);
    }
    else {
        ds_grid_read(imagen, ds_list_find_value(fotos, aguja));
    }
}

