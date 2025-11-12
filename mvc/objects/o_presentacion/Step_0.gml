/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var ww = ds_grid_width(imagen);
        var hh = ds_grid_height(imagen);
        var tot = ds_list_size(fotos);
        var buf = s_header(15, 8 + ww * hh * tot);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_u8, aguja);
        buffer_write(buf, buffer_u8, tot);
        var lnz = ds_grid_create(ww, hh);
        for (var i = 0; i < tot; i++) {
            ds_grid_read(lnz, ds_list_find_value(fotos, i));
            for (var w = 0; w < ww; w++) {
                for (var h = 0; h < hh; h++) {
                    buffer_write(buf, buffer_u8, ds_grid_get(lnz, w, h));
                }
            }
        }
        ds_grid_destroy(lnz);
        s_udp_send(buf, "");
    }
}


