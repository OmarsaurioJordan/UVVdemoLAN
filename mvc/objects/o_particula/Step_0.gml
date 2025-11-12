if activo {
    var acc = instance_nearest(x, y, o_acelerador);
    // vida e imagen
    image_angle += 70 * dlt;
    s_anima_osc(id, 0, max(2 - velocity / (acc.veloci_ini * 3), 0.2), 8);
    reloj_fin -= dlt;
    if reloj_fin <= 0 {
        activo = false;
        exit;
    }
    // movimiento fragmentado
    var discc = point_distance(acc.x, acc.y, x, y);
    velocity *= acc.friccion;
    var vel = velocity * dlt; // recorrido
    var num = max(1, ceil(vel / 4)); // segun sprite coli
    var dltt = dlt / num;
    var centry;
    var yop = id;
    var otr, ac, ad, cc, pd;
    for (var i = 0; i < num; i++) {
        // calor por baculo
        otr = instance_place(x, y, o_usuario);
        if otr != noone {
            if otr.objeto != 160 and otr.objeto != 161 {
                otr = noone;
            }
        }
        if otr != noone {
            cc = acc.transmision;
            if otr.objeto == 160 { // azul
                calor = max(0, calor - cc);
            }
            else { // rojo
                calor = min(1, calor + cc);
            }
        }
        // colision particulas y transmision calor
        otr = instance_place(x, y, o_particula);
        if otr != noone {
            velocity = max(velocity, acc.repulsion * dlt);
            ac = point_direction(otr.x, otr.y, x, y);
            ad = angle_difference(direction, ac);
            direction -= ad * dltt;
            cc = random((calor - otr.calor) / 2);
            if cc != 0 {
                calor = clamp(calor - cc, 0, 1);
                otr.calor = clamp(otr.calor + cc, 0, 1);
            }
        }
        // centrifugo
        centry = acc.centrifugo * acc.girar;
        if centry != 0 {
            velocity = max(velocity, centry * dlt);
            ac = point_direction(acc.x, acc.y, x, y) - 90;
            ad = angle_difference(direction, ac);
            direction -= min(abs(ad), centry * dltt) * sign(ad);
        }
        // colision solidos
        otr = instance_place(x, y, o_bloque);
        if otr != noone {
            velocity = max(velocity, acc.repulsion * dlt);
            ac = point_direction(otr.x, otr.y, x, y);
            ad = angle_difference(direction, ac) / 2;
            direction -= ad;
        }
        // atraccion repulsion
        centry = acc.atract;
        with o_usuario {
            if objeto == 158 { // blanco
                cc = 1;
            }
            else if objeto == 159 { // negro
                cc = -1;
            }
            else {
                continue;
            }
            pd = point_distance(x, y, yop.x, yop.y);
            if pd < acc.radio * 1.5 {
                ac = point_direction(x, y, yop.x, yop.y);
                ad = angle_difference(yop.direction, ac);
                pd = lerp(1, 0.5, pd / acc.radio);
                yop.direction -= min(abs(ad), centry * dltt * pd) * sign(ad) * cc;
                yop.velocity = max(yop.velocity, centry * dlt * pd);
            }
        }
        // mover un paso
        var vv = velocity * dltt;
        x += lengthdir_x(vv, direction);
        y += lengthdir_y(vv, direction);
    }
    // limites finales
    if discc > acc.radio {
        reloj_fin -= dlt * acc.decaimiento;
    }
    depth = -y;
}


