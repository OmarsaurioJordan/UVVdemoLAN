/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var ww = ds_grid_width(est_nex);
        var hh = ds_grid_height(est_nex);
        var buf = s_header(22, 6 + ww * hh);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_string, regla[0]);
        buffer_write(buf, buffer_string, regla[1]);
        for (var w = 0; w < ww; w++) {
            for (var h = 0; h < hh; h++) {
                buffer_write(buf, buffer_u8, ds_grid_get(saliente, w, h));
            }
        }
        s_udp_send(buf, "");
    }
    
    // funcionamiento juego de la vida
    if reloj_max != 0 {
        reloj_cambio -= dlt;
        if reloj_cambio <= 0 {
            reloj_cambio = reloj_max;
            // ejecucion
            var sum;
            ds_grid_copy(est_act, est_nex);
            var ww = ds_grid_width(est_nex);
            var hh = ds_grid_height(est_nex);
            for (var w = 0; w < ww; w++) {
                for (var h = 0; h < hh; h++) {
                    sum = ds_grid_get_sum(est_act, max(0, w - 1), max(0, h - 1),
                        min(ww - 1, w + 1), min(hh - 1, h + 1));
                    if ds_grid_get(est_act, w, h) != 0 { // viva
                        sum--;
                        if string_count(string(sum), regla[0]) != 0 {
                            ds_grid_set(est_nex, w, h, 1);
                        }
                        else {
                            ds_grid_set(est_nex, w, h, 0);
                        }
                    }
                    else { // muerta
                        if string_count(string(sum), regla[1]) != 0 {
                            ds_grid_set(est_nex, w, h, 1);
                        }
                        else {
                            ds_grid_set(est_nex, w, h, 0);
                        }
                    }
                }
            }
        }
        // optimizacion
        var ok = false;
        var yop = id;
        with o_gusano {
            if visible and origen == yop {
                ok = true;
                break;
            }
        }
        if !ok {
            exit;
        }
        // dibujado
        var ww = ds_grid_width(est_nex);
        var hh = ds_grid_height(est_nex);
        var act, nex;
        for (var w = 0; w < ww; w++) {
            for (var h = 0; h < hh; h++) {
                act = ds_grid_get(est_act, w, h);
                nex = ds_grid_get(est_nex, w, h);
                if act == 0 {
                    if nex == 0 { // 00
                        ds_grid_set(gusanos, w, h, 0);
                    }
                    else { // 01
                        ds_grid_set(gusanos, w, h,
                            clamp(1 - reloj_cambio / reloj_max, 0, 1));
                    }
                }
                else {
                    if nex == 0 { // 10
                        ds_grid_set(gusanos, w, h,
                            clamp(reloj_cambio / reloj_max, 0, 1));
                    }
                    else { // 11
                        ds_grid_set(gusanos, w, h, 1);
                    }
                }
            }
        }
    }
}


