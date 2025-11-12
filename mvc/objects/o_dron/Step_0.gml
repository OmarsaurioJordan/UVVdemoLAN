/// @description  errar

if !m_editor {
    s_anima_osc(id, 0, 1.4, 6);
    s_anima_paso(id, 0.1, 4);
    
    // calcular lugar a ir, cluster K-medias
    if random(1) < 0.03 {
        var xx = 0;
        var yy = 0;
        var nn = 0;
        with o_usuario {
            if objeto == 79 and estaonline {
                xx += x;
                yy += y;
                nn++;
            }
        }
        if nn > 0 {
            mx = xx / nn;
            my = yy / nn;
        }
    }
    
    // moverse hacia lugar
    var vel = point_distance(x, y, mx, my);
    if vel > 24 {
        vel = min(vel, o_control.velocidad * 1.1) * dlt;
        direction = point_direction(x, y, mx, my);
        x += lengthdir_x(vel, direction);
        y += lengthdir_y(vel, direction);
    }
    
    // prevenir salirse del mundo
    x = clamp(x, 0, room_width);
    y = clamp(y, 0, room_height);
    depth = -y;
}


