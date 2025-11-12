if visible {
    var g = ds_grid_get_sum(o_virtual_molino.opinador, 0, 2,
        o_control.cantidad_opiniones - 1, 2);
    image_angle -= max(0.25, g) * dlt * 22;
}


