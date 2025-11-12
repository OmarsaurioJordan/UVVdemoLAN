/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var ww = ds_grid_width(imagen);
        var hh = ds_grid_height(imagen);
        var buf = s_header(47, 6 + 5 * ww * hh);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        for (var w = 0; w < ww; w++) {
            for (var h = 0; h < hh; h++) {
                buffer_write(buf, buffer_u32, ds_grid_get(imagen, w, h));
            }
        }
        for (var w = 0; w < ww; w++) {
            for (var h = 0; h < hh; h++) {
                buffer_write(buf, buffer_u8, round(ds_grid_get(transp, w, h) * 255));
            }
        }
        s_udp_send(buf, "");
    }
}


