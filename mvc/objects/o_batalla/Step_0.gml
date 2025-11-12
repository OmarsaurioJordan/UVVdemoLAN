/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var lao = ds_grid_width(barcos);
        var buf = s_header(42, 6 + lao * lao * 2);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        for (var h = 0; h < lao; h++) {
            for (var w = 0; w < lao; w++) {
                buffer_write(buf, buffer_u8, ds_grid_get(barcos, w, h));
            }
        }
        for (var h = 0; h < lao; h++) {
            for (var w = 0; w < lao; w++) {
                buffer_write(buf, buffer_u8, ds_grid_get(tiros, w, h));
            }
        }
        s_udp_send(buf, "");
    }
    
    reloj_parti -= dlt;
    if reloj_parti <= 0 {
        reloj_parti = random_range(10, 20);
        var ppp = noone;
        var yop = id;
        with o_pbatll {
            if !activo {
                ppp = id;
                x = yop.x - 30;
                y = yop.y;
                activo = true;
                break;
            }
        }
        if ppp == noone {
            ppp = instance_create(x - 30, y, o_pbatll);
        }
        ppp.destino = instance_furthest(x - 30, y, o_batalla);
        ppp.direction = point_direction(x - 30, y,
            ppp.destino.x, ppp.destino.y);
        switch s_batalla_estado() {
            case 0: ppp.color = c_aqua; break;
            case 1: ppp.color = c_yellow; break;
            case 2: ppp.color = c_red; break;
        }
    }
}


