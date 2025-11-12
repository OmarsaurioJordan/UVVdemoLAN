/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var buf = s_header(49, 4 + 7 * o_control.cantidad_opiniones);
        buffer_write(buf, buffer_u32, fecha);
        for (var i = 0; i < o_control.cantidad_opiniones; i++) {
            buffer_write(buf, buffer_u16, ds_grid_get(opinador, i, 0));
            buffer_write(buf, buffer_u32, ds_grid_get(opinador, i, 1));
            buffer_write(buf, buffer_u8, ds_grid_get(opinador, i, 2) + 1);
        }
        s_udp_send(buf, "");
    }
    
    // ver si caduco una opinion
    if random(1) < 0.01 {
        var now = s_current_time() - o_control.duracion_opiniones;
        var f;
        for (var i = 0; i < o_control.cantidad_opiniones; i++) {
            f = ds_grid_get(opinador, i, 1);
            if f != 0 and f < now {
                ds_grid_set(opinador, i, 0, 0);
                ds_grid_set(opinador, i, 1, 0);
                ds_grid_set(opinador, i, 2, 0);
            }
        }
    }
    
    // llover
    var g = max(0, ds_grid_get_sum(o_virtual_molino.opinador, 0, 2,
        o_control.cantidad_opiniones - 1, 2)) / o_control.cantidad_opiniones;
    repeat irandom(g * 60) {
        s_gota();
    }
    if random(1) < 0.1 {
        if g != 0 {
            var el = o_control.mipropio;
            var cc = instance_nearest(el.x, el.y, o_pnt_techo);
            if el.objeto == 162 or
                    point_distance(el.x, el.y, cc.x, cc.y) < o_control.radio_zona {
                audio_sound_gain(audiolluvia, lerp(0.1, 0.7, g) / 2, 0);
            }
            else {
                audio_sound_gain(audiolluvia, lerp(0.1, 0.7, g), 0);
            }
        }
        else {
            audio_sound_gain(audiolluvia, 0, 0);
        }
    }
}


