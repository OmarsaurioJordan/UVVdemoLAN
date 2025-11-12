/// @description  errar

if !m_editor and o_evolutivo.activo {
    s_anima_osc(id, 0, 1.4, 6);
    s_anima_osc(id, 1, 0.2, 9);
    
    // reloj de dormir y ver si activo
    var activo = true;
    dormir += dlt;
    if dormir >= o_control.bicho_dormir {
        dormir = 0;
        errar = random_range(0.2, 0.8) * o_control.bicho_dormir;
    }
    if dormir > errar {
        mx = x;
        my = y;
        activo = false;
    }
    
    // buscar lugar al azar
    if activo and point_distance(x, y, mx, my) < 24 {
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
    
    // moverse hacia lugar
    if activo {
        direction = point_direction(x, y, mx, my);
        var vvv = o_control.vel_alimento * dlt;
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
        var vvv = max(o_control.vel_alimento, o_control.velocidad) * dlt * 1.25;
        x += lengthdir_x(vvv, direction);
        y += lengthdir_y(vvv, direction);
    }
    else {
        otr = instance_place(x, y, o_voladorcito);
        if otr != noone {
            direction = point_direction(otr.x, otr.y, x, y);
            var vvv = o_control.vel_alimento * dlt * 0.5;
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
}


