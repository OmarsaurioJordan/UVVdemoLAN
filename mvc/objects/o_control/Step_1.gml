///GAME
dlt = min(0.1, delta_time * 0.000001);

// poner microfono en camara
audio_listener_position(view_xview[0] + view_wview[0] / 2,
    view_yview[0] + view_hview[0] / 2, view_hview[0] / 2);

// ahorro grafico
var xx = view_xview[0] - 300;
var yy = view_yview[0] - 300;
var xw = view_xview[0] + view_wview[0] + 300;
var yh = view_yview[0] + view_hview[0] + 300;
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
reloj_busqueda_lan -= dlt;
if reloj_busqueda_lan <= 0 {
    reloj_busqueda_lan = esp_lan + random(1);
    var ok = true;
    if g_network == m_net_client {
        for (var i = 1; i < ds_list_size(conectados); i++) {
            if ds_list_find_value(esserver, i) {
                ok = false;
                break;
            }
        }
    }
    if ok {
        intercalador = !intercalador;
        var msc = mascvlan;
        if intercalador or msc == "" {
            msc = mascara;
        }
        for (var i = 1; i < 255; i++) {
            network_enviados++;
            network_env_bytes += saludo_size + m_head_udp;
            network_send_udp_raw(conexion, msc + string(i), m_web, saludo_buf, saludo_size);
        }
    }
}

// enviar contactos
if g_network != m_net_client {
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
}

// eliminar de la lista a los desconectados
var new;
var revisar = false;
for (var i = 1; i < ds_list_size(tiempomuerto); i++) {
    new = ds_list_find_value(tiempomuerto, i) - dlt;
    if new <= 0 and ds_list_find_value(esserver, i) {
        ds_priority_delete_value(prioridad, ds_list_find_value(idconectados, i));
        ds_list_delete(tiempomuerto, i);
        ds_list_delete(conectados, i);
        ds_list_delete(idconectados, i);
        ds_list_delete(esserver, i);
        revisar = true;
    }
    else {
        ds_list_replace(tiempomuerto, i, new);
    }
}
// quitar todos los conectados si cliente pierde conexion con servidor
if revisar and g_network == m_net_client {
    revisar = false;
    for (var i = 1; i < ds_list_size(tiempomuerto); i++) {
        if ds_list_find_value(esserver, i) {
            revisar = true;
            break;
        }
    }
    if !revisar {
        for (var i = ds_list_size(conectados) - 1; i > 0; i--) {
            ds_priority_delete_value(prioridad,
                ds_list_find_value(idconectados, i));
            ds_list_delete(tiempomuerto, i);
            ds_list_delete(conectados, i);
            ds_list_delete(idconectados, i);
            ds_list_delete(esserver, i);
        }
    }
}

// enviar solicitu de actualizacion
optimi_sinc -= dlt;
if optimi_sinc <= 0 {
    optimi_sinc = esp_sinc + random(1);
    var buf = s_buf_fechas();
    s_udp_send(buf, "");
}

// estadisticas networking
reloj_network_est -= dlt;
if reloj_network_est <= 0 {
    randomize();
    var muestreo = 10; // segundos para muestreo estadisticas
    reloj_network_est += muestreo;
    // datos
    network_estadist =
        "Env: " + string((network_enviados / muestreo) / 1) + " /s" +
        "#Env: " + string(round(((network_env_bytes * 8) / muestreo) / 1000)) + " Kbps" +
        "#Rec: " + string((network_recibidos / muestreo) / 1) + " /s" +
        "#Rec: " + string(round(((network_rec_bytes * 8) / muestreo) / 1000)) + " Kbps";
    // limpiar
    network_enviados = 0;
    network_env_bytes = 0;
    network_recibidos = 0;
    network_rec_bytes = 0;
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


