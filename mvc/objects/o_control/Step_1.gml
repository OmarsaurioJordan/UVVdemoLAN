/// @description GAME
var s = delta_time * 0.000001;
dlt = min(0.1, s);
game_freezing_time = max(game_freezing_time, s);
game_fps_max = max(game_fps_max, fps_real);
game_fps_min = min(game_fps_min, fps_real);

// poner microfono en camara
audio_listener_position(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2,
    __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, __view_get( e__VW.HView, 0 ) / 2);

// ahorro grafico
var xx = __view_get( e__VW.XView, 0 ) - 300;
var yy = __view_get( e__VW.YView, 0 ) - 300;
var xw = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) + 300;
var yh = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) + 300;
with o_visible {
    visible = point_in_rectangle(x, y, xx, yy, xw, yh) ;
}
if m_editor {
    with o_usuario {
        visible = false;
    }
    with o_kreature {
        visible = false;
    }
}

// buscar nuevas palabras ahorcado
reloj_ahorcado_palabras -= dlt;
if reloj_ahorcado_palabras <= 0 {
    reloj_ahorcado_palabras = reloj_ahorcado_palabras_max;
    s_ahorcado_words();
}

// buscar nombres repetidos y si existe contacto
if random(1) < 0.003 {
    // tambien hace que solo un cartel UV se pueda tener
    var uv = false;
    var id_uv = sprite_get_number(d_objeto) - 1;
    with o_usuario {
        s_nombre_unico(id);
        if objeto == id_uv {
            if uv {
                objeto = 0;
            }
            else {
                uv = true;
            }
        }
    }
    with mipropio {
        for (var c = 0; c < o_control.total_contactos; c++) {
            if amigo[c] != 0 and s_busca_nombre(amigo[c]) == "???" {
                amigo[c] = 0;
            }
        }
        for (var b = 0; b < o_control.total_bloqueados; b++) {
            if enemigo[b] != 0 and s_busca_nombre(enemigo[b]) == "???" {
                enemigo[b] = 0;
            }
        }
    }
}

// para cerrar juego
reloj_exit = max(0, reloj_exit - dlt);


///LAN

// buscar redes LAN
if !ds_stack_empty(broadcast) {
    network_enviados++;
    network_env_bytes += saludo_size + m_head_udp;
    var _ip = ds_stack_pop(broadcast);
    network_send_udp_raw(conexion, _ip, m_web, saludo_buf, saludo_size);
}
else {
    reloj_busqueda_lan -= dlt;
    if reloj_busqueda_lan <= 0 {
        reloj_busqueda_lan = esp_lan + random(1);
        var _msk = s_ip_str_int(enmascara);
        var _lan = s_ip_str_int(mascara);
        var _rango = min(65535, 4294967295 - _msk);
        var _ip;
        for (var i = _rango; i > 0; i--) {
            _ip = s_ip_str_int((_lan & _msk) + i);
            ds_stack_push(broadcast, _ip);
        }
        if crear_archivo_lan {
            crear_archivo_lan = false;
            var f = file_text_open_write("lan_ips.txt");
            for (var i = _rango; i > 0; i--) {
                _ip = s_ip_str_int((_lan & _msk) + i);
                file_text_write_string(f, _ip);
                file_text_writeln(f);
            }
            file_text_close(f);
        }
    }
}

// enviar contactos
reloj_contactos -= dlt;
if reloj_contactos <= 0 {
    reloj_contactos = esp_contactos + random(1);
    var tot = ds_list_size(conectados) - 1;
    var buf = s_header(29, 2 + 6 * tot);
    buffer_write(buf, buffer_u16, tot);
    var idw;
    for (var i = 1; i < ds_list_size(conectados); i++) {
        idw = ds_list_find_value(idconectados, i);
        buffer_write(buf, buffer_string, ds_list_find_value(conectados, i));
        buffer_write(buf, buffer_u16, idw);
        buffer_write(buf, buffer_f32, ds_priority_find_priority(prioridad, idw));
    }
    s_udp_send(buf, "");
}

// eliminar de la lista a los desconectados
var nuevo;
for (var i = 1; i < ds_list_size(tiempomuerto); i++) {
    nuevo = ds_list_find_value(tiempomuerto, i) - dlt;
    if nuevo <= 0 {
        ds_priority_delete_value(prioridad, ds_list_find_value(idconectados, i));
        ds_list_delete(tiempomuerto, i);
        ds_list_delete(conectados, i);
        ds_list_delete(idconectados, i);
    }
    else {
        ds_list_replace(tiempomuerto, i, nuevo);
    }
}

// enviar solicitu de actualizacion
optimi_sinc -= dlt;
if optimi_sinc <= 0 {
    optimi_sinc = esp_sinc + random(1);
    var buf = s_buf_fechas();
    s_udp_send(buf, "");
}

// actualizar constantemente posicion de NPCs
if s_permiso_pro() {
    reloj_kriature -= dlt;
    if reloj_kriature <= 0 {
        reloj_kriature = actu_kreature;
        var buf = s_buf_kreatures();
        s_udp_send(buf, "");
    }
}

// estadisticas networking
reloj_network_est -= dlt;
if reloj_network_est <= 0 {
    randomize();
    var muestreo = m_muestreo; // segundos para muestreo estadisticas
    reloj_network_est += muestreo;
    // datos
    var ddd;
    ddd[0] = string((network_enviados / muestreo) / 1);
    ddd[1] = string(round(((network_env_bytes * 8) / muestreo) / 1000));
    ddd[2] = string((network_recibidos / muestreo) / 1);
    ddd[3] = string(round(((network_rec_bytes * 8) / muestreo) / 1000));
    network_estadist =
        "Env: " + ddd[0] + " /s" +
        "#Env: " + ddd[1] + " Kbps" +
        "#Rec: " + ddd[2] + " /s" +
        "#Rec: " + ddd[3] + " Kbps";
    // escribir log
    if m_log {
        var f = file_text_open_append("log.txt");
        var d = date_datetime_string(date_current_datetime()) + "," +
            string(ds_list_size(conectados)) + "," +
            ddd[0] + "," + ddd[1] + "," + ddd[2] + "," + ddd[3] + "," +
            string(game_freezing_time) + "," +
            string(game_fps_max) + "," + string(game_fps_min);
        file_text_write_string(f, d);
        file_text_writeln(f);
        file_text_close(f);
    }
    // limpiar
    network_enviados = 0;
    network_env_bytes = 0;
    network_recibidos = 0;
    network_rec_bytes = 0;
    game_freezing_time = 0;
    game_fps_max = 0;
    game_fps_min = 1000;
}


