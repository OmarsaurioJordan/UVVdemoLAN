if !m_editor and o_evolutivo.activo {
    s_anima_osc(id, 0, 1.4, 6);
    s_anima_osc(id, 1, lerp(1, 0.1, gen[0]), 9);
    
    // reloj de dormir y ver si activo
    activo = true;
    dormir += dlt;
    if dormir >= o_control.bicho_dormir {
        dormir = 0;
    }
    if dormir > fenotipo[5] {
        activo = false;
        mx = x;
        my = y;
    }
    
    // buscar alimento en rango de vision
    objetivo = noone;
    if instance_exists(o_alimento) {
        objetivo = instance_nearest(x, y, o_alimento);
        if point_distance(x, y, objetivo.x, objetivo.y) > fenotipo[0] {
            objetivo = noone;
        }
        else if levantado or random(1) < lerp(0.01, 0.1, gen[5]) {
            levantado = true;
            activo = true;
        }
        else {
             objetivo = noone;
        }
    }
    if !activo {
       levantado = false;
    }
    
    // buscar lugar al azar
    if objetivo == noone and activo and point_distance(x, y, mx, my) < 24 {
        var neabos;
        var fren = 0;
        do {
            mx = x + random_range(-__view_get( e__VW.WView, 0 ), __view_get( e__VW.WView, 0 ));
            my = y + random_range(-__view_get( e__VW.HView, 0 ), __view_get( e__VW.HView, 0 ));
            neabos = instance_nearest(mx, my, o_pnt_lago2);
            fren++;
        }
        until (point_distance(mx, my, neabos.x, neabos.y) < o_control.radio_zona and
            !place_meeting(mx, my, o_bloque)) or fren >= 100;
    }
    
    // moverse hacia alimento o lugar
    if objetivo != noone {
        direction = point_direction(x, y, objetivo.x, objetivo.y);
        var vvv = fenotipo[1] * dlt;
        x += lengthdir_x(vvv, direction);
        y += lengthdir_y(vvv, direction);
    }
    else if activo {
        direction = point_direction(x, y, mx, my);
        var vvv = fenotipo[1] * dlt;
        x += lengthdir_x(vvv, direction);
        y += lengthdir_y(vvv, direction);
    }
    
    // detectar colisiones y resolver
    var otr = instance_place(x, y, o_bloque);
    if otr == noone {
        otr = instance_place(x, y, o_movil);
    }
    if otr != noone {
        direction = point_direction(otr.x, otr.y, x, y);
        var vvv = max(fenotipo[1], o_control.velocidad) * dlt * 1.25;
        x += lengthdir_x(vvv, direction);
        y += lengthdir_y(vvv, direction);
    }
    else {
        otr = instance_place(x, y, o_bicho);
        if otr != noone {
            direction = point_direction(otr.x, otr.y, x, y);
            var vvv = fenotipo[1] * dlt * 0.5;
            x += lengthdir_x(vvv, direction);
            y += lengthdir_y(vvv, direction);
            otr.x += lengthdir_x(vvv, -direction);
            otr.y += lengthdir_y(vvv, -direction);
        }
    }
    
    // prevenir salirse del mundo
    x = clamp(x, 0, room_width);
    y = clamp(y, 0, room_height);
    depth = -y;
    
    // consumir energia
    energia -= (fenotipo[0] / o_control.bicho_vision) * o_control.bicho_cp * (1 + gen[4] * 2);
    if activo {
        var vvv = point_distance(x, y, xprevious, yprevious) / dlt;
        energia -= vvv * o_control.bicho_ca;
    }
    
    // interaccion con otros
    if activo and objetivo == noone {
        var lej = false;
        blanco = collision_circle(x, y, 32, o_bicho, true, true);
        if blanco == noone {
            blanco = collision_circle(x, y, 64, o_bicho, true, true);
            lej = true;
        }
        if blanco != noone {
            var comport = random(gen[4]) > random(gen[3]);
            var fami = (blanco.madre == madre and madre != noone) or madre == blanco or id == blanco.madre;
            // actividad social
            if fami and !comport {
                if blanco.energia < blanco.fenotipo[2] * fenotipo[3] and energia > fenotipo[2] * 0.69 {
                    s_audio(x, y, a_evo_empatia, false);
                    var lime = min(o_control.bicho_alimento, energia * 0.5,
                        blanco.fenotipo[2] - blanco.energia);
                    energia -= lime;
                    blanco.energia += lime;
                }
            }
            // actividad agresiva
            else if !fami and comport and !lej {
                var propbla = blanco.energia / blanco.fenotipo[2] < energia / fenotipo[2];
                if propbla and blanco.energia < blanco.fenotipo[2] * fenotipo[4] {
                    s_audio(x, y, a_evo_golpe, false);
                    if random(gen[4]) > random(blanco.gen[4]) {
                        var lime = min(o_control.bicho_alimento,
                            fenotipo[2] - energia, blanco.energia);
                        energia += lime;
                        blanco.energia -= lime;
                    }
                    else {
                        energia -= min(o_control.bicho_alimento, energia);
                    }
                }
            }
        }
    }
    
    // comer cosas cercanas
    var comida = collision_circle(x, y, 10, o_alimento, true, false);
    if comida != noone {
        if fenotipo[2] - energia >= comida.energia {
            energia += comida.energia;
            with comida {
                instance_destroy();
            }
        }
        else {
            comida.energia -= fenotipo[2] - energia;
            energia = fenotipo[2];
        }
    }
    
    // ver si reproducrise
    if energia > fenotipo[2] * 0.95 {
        s_audio(x, y, a_evo_reproduccion, false);
        hijos++;
        energia /= 2;
        var aux = instance_create(x + random_range(-1, 1),
            y + random_range(-1, 1), o_bicho);
        aux.madre = id;
        s_mutacion(id, aux);
        aux.generacion = generacion + 1;
        aux.energia = min(energia, aux.fenotipo[2]);
    }
    
    // morir si no tiene energia
    edad += dlt;
    if energia <= 0 {
        instance_destroy();
    }
}


