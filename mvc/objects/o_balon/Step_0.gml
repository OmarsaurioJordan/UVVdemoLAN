if s_permiso_pro() {
    s_anima_osc(id, 0, 0.69, 16 * (velocity / origen.patada));
    // buscar quien da la patada
    reloj_toque = max(0, reloj_toque - dlt);
    var otr = noone;
    if reloj_toque == 0 {
        var yop = id;
        var list = ds_list_create();
        with o_usuario {
            if place_meeting(posx, posy, yop) {
                ds_list_add(list, id);
            }
        }
        ds_list_shuffle(list);
        while !ds_list_empty(list) {
            otr = ds_list_find_value(list, 0);
            ds_list_delete(list, 0);
            if otr.objeto != 81 and otr.objeto != 82 {
                otr = noone;
            }
            else {
                break;
            }
        }
        ds_list_destroy(list);
    }
    // dar patada direccionadora
    if otr != noone {
        reloj_toque = 0.5;
        if otr.propietario {
            direcc = point_direction(posx, posy, mouse_x, mouse_y);
        }
        else {
            direcc = point_direction(posx, posy, otr.puntero_x, otr.puntero_y);
        }
        velocity = origen.patada;
    }
    // rebote con reja
    otr = instance_nearest(posx, posy, o_pnt_reja);
    if point_distance(posx, posy, otr.x, otr.y) < o_control.radio_zona {
        var cch = instance_nearest(posx, posy, o_pnt_normal);
        var ac = point_direction(posx, posy, cch.x, cch.y);
        var ad = angle_difference(-direcc, ac);
        if ad > 90 {
            ad -= 90;
        }
        else if ad < -90 {
            ad += 90;
        }
        direcc = ac + ad;
        velocity = max(velocity, 30);
    }
    // movimiento
    velocity *= origen.friccion;
    var vv = velocity * dlt;
    posx += lengthdir_x(vv, direcc);
    posy += lengthdir_y(vv, direcc);
    // hacer gol
    otr = instance_place(posx, posy, o_cancha);
    if otr != noone {
        with origen {
            if otr.x < x {
                puntos[0]++;
                if puntos[0] >= puntos_futbol and reloj_juego == 0 {
                    enjuego = false;
                }
                else {
                    reloj_balon = 5;
                    if reloj_juego != 0 {
                        reloj_juego += 5;
                    }
                }
            }
            else {
                puntos[1]++;
                if puntos[1] >= puntos_futbol and reloj_juego == 0 {
                    enjuego = false;
                }
                else {
                    reloj_balon = 5;
                    if reloj_juego != 0 {
                        reloj_juego += 5;
                    }
                }
            }
            fecha = s_current_time();
            reloj_delta = 2;
            reloj_sinc = 0;
        }
        instance_destroy();
        exit;
    }
    // sincronizacion posicion
    var vel = point_distance(x, y, posx, posy);
    if vel > 100 {
        x = posx;
        y = posy;
        reloj_reset = 60;
    }
    else if vel > 4 {
        vel *= dlt * 4;
        direcc = point_direction(x, y, posx, posy);
        x += lengthdir_x(vel, direcc);
        y += lengthdir_y(vel, direcc);
        reloj_reset = 60;
    }
    else {
        reloj_reset -= dlt;
        if reloj_reset <= 0 {
            // finalizar juego
            origen.puntos[0] = 0;
            origen.puntos[1] = 0;
            origen.reloj_juego = 0;
            origen.reloj_balon = 0;
            origen.enjuego = false;
            origen.fecha = s_current_time() + 3;
            origen.reloj_delta = 2;
            origen.reloj_sinc = 0;
            instance_destroy();
            exit;
        }
    }
    while direcc < 0 {
        direcc += 360;
    }
    while direcc >= 360 {
        direcc -= 360;
    }
    depth = -y;
}


