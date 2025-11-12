/// @description  IA

// animacion
s_anima_osc(id, 0, 1.1, 2); // cuerpo
s_anima_osc(id, 1, 0.81, 1); // cabeza
s_anima_osc(id, 2, 0.69, 2); // objeto

if !m_editor {
    if s_ciclo_actualizador(id) {
        var buf = s_header(54, 7);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_u8, tipok);
        s_udp_send(buf, "");
    }
}

if s_permiso_pro() {
    
    // verificar exista mascota uv
    if random(1) < 0.001 {
        if tipok == 0 {
            var yop = id;
            with o_kreature {
                if id != yop and tipok == 0 {
                    yop.tipok = irandom_range(1, sprite_get_number(d_kreature) / 4 - 1);
                    yop.fecha = s_current_time();
                    yop.reloj_sinc = 0;
                    break;
                }
            }
        }
        else {
            var ok = true;
            with o_kreature {
                if tipok == 0 {
                    ok = false;
                    break;
                }
            }
            if ok {
                tipok = 0;
                fecha = s_current_time();
                reloj_sinc = 0;
            }
        }
    }
    
    // rebote
    var impasable = false;
    var otr = instance_place(posx, posy, o_bloque);
    if otr == noone {
        otr = instance_place(posx, posy, o_tiro_pesado);
        if otr != noone {
            if otr.altura > 82 {
                otr = noone;
            }
            else {
                impasable = true;
            }
        }
        if otr == noone {
            otr = collision_circle(posx, posy, 12, o_movil, true, true); // base_u(8) + 4 px
        }
    }
    else {
        var elparent = object_get_parent(otr.object_index);
        if elparent != o_especial and elparent != o_game {
            impasable = true;
        }
    }
    if otr != noone {
        direction = point_direction(otr.x, otr.y, posx, posy);
        var vel;
        if impasable {
            vel = o_control.velocidad * dlt * 1.25;
        }
        else {
            vel = o_control.velocidad * dlt;
        }
        posx += lengthdir_x(vel, direction);
        posy += lengthdir_y(vel, direction);
    }
    
    // relojes
    var move = reloj_move < reloj_quiet;
    if move {
        if point_distance(posx, posy, metax, metay) < 24 {
            reloj_move = 0;
        }
        if reloj_move < s_current_time() {
            var aux, pnt;
            switch s_salvajismo(id) {
                case 0: // salvaje
                    pnt = o_pnt_floral;
                    break;
                case 2: // humanoide
                    pnt = o_pnt_techo;
                    break;
                default: // domestico
                    pnt = o_pnt;
                    break;
            }
            do {
                metax = irandom(room_width);
                metay = irandom(room_height);
                aux = instance_nearest(metax, metay, pnt);
                if point_distance(metax, metay, aux.x, aux.y) > o_control.radio_zona {
                    metax = 0;
                    continue;
                }
                var cel = o_control.nav_celda;
                if ds_grid_get(o_control.zona, round(metax / cel), round(metay / cel)) == -1 {
                    metax = 0;
                }
            }
            until metax != 0;
            reloj_quiet = s_current_time() + irandom_range(
                o_control.quieto_min, o_control.quieto_max);
            reloj_move = reloj_quiet + 30 +
                round(point_distance(posx, posy, metax, metay) / 10);
            fechamove = s_current_time() - irandom(100);
        }
    }
    else {
        if reloj_quiet < s_current_time() {
            reloj_quiet = reloj_move + 1;
        }
    }
    
    // ejecutar movimiento
    if move and !impasable {
        var vel = o_control.velocidad * dlt * 0.5;
        if s_enagua(posx, posy) {
            vel *= 0.75;
        }
        var cel = o_control.nav_celda;
        var wmax = ceil(room_width / cel);
        var hmax = ceil(room_height / cel);
        var ww = round(posx / cel);
        var hh = round(posy / cel);
        var menor = ds_grid_get_min(rumbo, max(0, ww - 1), max(0, hh - 1),
            min(wmax - 1, ww + 1), min(hmax - 1, hh + 1));
        if menor != 1000000 {
            var xx = ds_grid_value_x(rumbo, max(0, ww - 1), max(0, hh - 1),
                min(wmax - 1, ww + 1), min(hmax - 1, hh + 1), menor);
            var yy = ds_grid_value_y(rumbo, max(0, ww - 1), max(0, hh - 1),
                min(wmax - 1, ww + 1), min(hmax - 1, hh + 1), menor);
            direction = point_direction(ww, hh, xx, yy);
        }
        else {
            direction = random(360);
        }
        posx += lengthdir_x(vel, direction);
        posy += lengthdir_y(vel, direction);
        // hacer colision lejana para evitar estancarse
        otr = collision_circle(posx, posy, 16, o_bloque, true, false);
        if otr != noone {
            direction = point_direction(otr.x, otr.y, posx, posy);
            posx += lengthdir_x(vel * 0.8, direction);
            posy += lengthdir_y(vel * 0.8, direction);
        }
    }
    
    // limites
    posx = clamp(posx, 0, room_width);
    posy = clamp(posy, 0, room_height);
    
    // recalcular camino
    if metax != viemetx or metay != viemety {
        if metax != 0 and metay != 0 {
            s_calcula_rejilla_pro(metax, metay, rumbo);
        }
        viemetx = metax;
        viemety = metay;
    }
}

// ejecucion general
//
// sincronizacion posicion
var vel = point_distance(x, y, posx, posy);
if vel > 100 {
    x = posx;
    y = posy;
}
else if vel > 4 {
    vel *= dlt * 2;
    direction = point_direction(x, y, posx, posy);
    x += lengthdir_x(vel, direction);
    y += lengthdir_y(vel, direction);
}
// sonido
if random(1) < 0.001 {
    switch tipok {
        case 1: s_audio(x, y, a_perro, false); break;
        case 2: s_audio(x, y, a_gato, false); break;
        case 3: s_audio(x, y, a_vaca, false); break;
    }
}

// animacion
s_anima_paso(id, 0.2, 6); // pies
depth = -y;


