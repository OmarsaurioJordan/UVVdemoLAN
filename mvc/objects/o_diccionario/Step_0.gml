/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        if solo_aguja {
            solo_aguja = false;
            var buf = s_header(13, 7);
            buffer_write(buf, buffer_u16, idweb);
            buffer_write(buf, buffer_u32, fecha);
            buffer_write(buf, buffer_u8, aguja);
            s_udp_send(buf, "");
        }
        else {
            var ww = ds_grid_width(imagen);
            var hh = ds_grid_height(imagen);
            var lnz = ds_grid_create(ww, hh);
            var txt;
            var tot = 0;
            for (var i = 0; i < ds_list_size(titulos); i++) {
                tot += string_length(ds_list_find_value(titulos, i));
                tot += string_length(ds_list_find_value(infos, i));
                tot++;
                txt = ds_list_find_value(fotos, i);
                if txt != "" {
                    tot += ww * hh;
                }
            }
            var buf = s_header(12, 7 + tot);
            buffer_write(buf, buffer_u16, idweb);
            buffer_write(buf, buffer_u32, fecha);
            buffer_write(buf, buffer_u8, aguja);
            for (var i = 0; i < ds_list_size(titulos); i++) {
                buffer_write(buf, buffer_string, ds_list_find_value(titulos, i));
                buffer_write(buf, buffer_string, ds_list_find_value(infos, i));
                txt = ds_list_find_value(fotos, i);
                if txt == "" {
                    buffer_write(buf, buffer_u8, 0);
                }
                else {
                    buffer_write(buf, buffer_u8, 1);
                    ds_grid_read(lnz, txt);
                    for (var w = 0; w < ww; w++) {
                        for (var h = 0; h < hh; h++) {
                            buffer_write(buf, buffer_u8, ds_grid_get(lnz, w, h));
                        }
                    }
                }
            }
            ds_grid_destroy(lnz);
            s_udp_send(buf, "");
        }
    }
}


