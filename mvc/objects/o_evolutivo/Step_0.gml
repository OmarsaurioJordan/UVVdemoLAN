/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var buf = s_header(34, 11 + 6);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_u8, fuerza_mutacion);
        buffer_write(buf, buffer_u8, fuerza_recombinacion);
        buffer_write(buf, buffer_u8, densidad_alimento);
        // encontrar genes promedio de la poblacion, y talla de esta
        var ggg;
        for (var g = 0; g < 6; g++) {
            ggg[g] = 0;
        }
        var tot = 0;
        with o_bicho {
            for (var g = 0; g < 6; g++) {
                ggg[g] += gen[g];
            }
            tot++;
        }
        if tot > 1 {
            for (var g = 0; g < 6; g++) {
                ggg[g] /= tot;
            }
        }
        buffer_write(buf, buffer_u16, tot);
        for (var g = 0; g < 6; g++) {
            buffer_write(buf, buffer_u8, round(ggg[g] * 255));
        }
        s_udp_send(buf, "");
    }
    
    // reloj aleatorio para modificar cosas
    var man = o_control.mipropio;
    activo = point_distance(x, y, man.x, man.y) < __view_get( e__VW.WView, 0 ) * 2;
    if activo and random(1) < 0.1 {
        // crear bicho inicial
        if random(1) < 0.01 and !instance_exists(o_bicho) {
            s_pobla_bichos(id, true);
        }
        // crear alimento
        if random(1) < lerp(0.05, 0.4, densidad_alimento / 9) and
                instance_number(o_alimento) < 50 {
            s_pobla_bichos(id, false);
        }
        // estadisticas
        num_bichos = 0;
        num_genmax = 1;
        var yop = id;
        with o_bicho {
            yop.num_genmax = max(yop.num_genmax, generacion);
            yop.num_bichos++;
        }
    }
}


