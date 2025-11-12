/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var tll = ds_grid_width(tablero);
        var buf = s_header(43, 10 + tll * tll * 2);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_u16, turno);
        buffer_write(buf, buffer_u8, ultimo[0]);
        buffer_write(buf, buffer_u8, ultimo[1]);
        var aux;
        for (var h = 0; h < tll; h++) {
            for (var w = 0; w < tll; w++) {
                aux = ds_grid_get(tablero, w, h);
                buffer_write(buf, buffer_u8, aux.tipo);
                buffer_write(buf, buffer_u8, ceil(aux.mostrado) + 1);
            }
        }
        s_udp_send(buf, "");
    }
}


