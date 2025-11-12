var la_ip = ds_map_find_value(async_load, "ip");
var buf = ds_map_find_value(async_load, "buffer");
var sizbuf = ds_map_find_value(async_load, "size");
if sizbuf >= 5 {
    buffer_seek(buf, buffer_seek_start, 0);
    var okk = true
    if buffer_read(buf, buffer_u16) != m_web {
        okk = false;
    }
    else if buffer_read(buf, buffer_u8) != m_version {
        okk = false;
    }
    else {
        var ttt = buffer_read(buf, buffer_u8);
        switch g_network {
            case m_net_peer:
                okk = ttt == m_net_peer;
                break;
            case m_net_server:
                okk = ttt == m_net_client;
                break;
            case m_net_client:
                okk = ttt == m_net_server;
                break;
            default:
                okk = false;
                break;
        }
    }
    if okk {
        network_recibidos++;
        network_rec_bytes += sizbuf + m_head_udp;
        var tt_tt = buffer_read(buf, buffer_u8);
        switch tt_tt {
            
            case 0: // saludo inicial o re saludar
                var idw = buffer_read(buf, buffer_u16);
                var llave = buffer_read(buf, buffer_u16);
                var influ = buffer_read(buf, buffer_f32);
                var pos = ds_list_find_index(conectados, la_ip);
                // el remitente IP no esta en la lista
                if pos == -1 {
                    var duplicado = ds_list_find_index(idconectados, idw);
                    // es este mismo IDweb actual
                    if duplicado == 0 {
                        // evitar auto desconexion por diferentes IP de esta misma maquina
                        if llave == llave_lan {
                            if ds_list_find_value(conectados, 0) == "127.0.0.1" {
                                ds_list_replace(conectados, 0, la_ip);
                            }
                        }
                        // pedir al duplicado de este actual usuario que se desconecte
                        else {
                            var buf = s_header(9, 0);
                            var tll = buffer_tell(buf);
                            network_enviados++;
                            network_env_bytes += tll + m_head_udp;
                            network_send_udp_raw(conexion, la_ip, m_web, buf, tll);
                            buffer_delete(buf);
                        }
                    }
                    // agregar al nuevo conectado y reenviar saludo por si acaso
                    else if duplicado == -1 {
                        var agg = true;
                        // el cliente solo puede conectar con un servidor a la vez
                        if g_network == m_net_client {
                            for (var i = 1; i < ds_list_size(conectados); i++) {
                                if ds_list_find_value(esserver, i) {
                                    agg = false;
                                    break;
                                }
                            }
                        }
                        if agg {
                            ds_list_add(conectados, la_ip);
                            ds_list_add(tiempomuerto, udp_tiempomuerto);
                            ds_list_add(idconectados, idw);
                            ds_list_add(esserver, true);
                            ds_priority_add(prioridad, idw, influ);
                            network_enviados++;
                            network_env_bytes += saludo_size + m_head_udp;
                            network_send_udp_raw(conexion, la_ip, m_web, saludo_buf, saludo_size);
                        }
                    }
                    // los duplicados a desconectar se trataran en el siguiente else
                }
                // el remitente IP ya esta en la lista, pero no coinciden los IDweb
                else if ds_list_find_value(idconectados, pos) != idw {
                    // si el idweb del remitente es desconocido en la lista, actualizarlo
                    var duplicado = ds_list_find_index(idconectados, idw);
                    if duplicado == -1 {
                        ds_list_replace(idconectados, pos, idw);
                    }
                    // el idweb esta en otro lado de la lista que no coincide con su IP
                    else if g_network == m_net_server {
                        var buf = s_header(9, 0);
                        var tll = buffer_tell(buf);
                        network_enviados++;
                        network_env_bytes += tll + m_head_udp;
                        network_send_udp_raw(conexion, la_ip, m_web, buf, tll);
                        buffer_delete(buf);
                    }
                    else if llave != llave_lan {
                        // tratar de corregir colision
                        with mipropio {
                            if file_exists("usuario" + string(idweb) + ".ini") {
                                file_delete("usuario" + string(idweb) + ".ini");
                            }
                            idweb = irandom_range(1, 65535);
                        }
                        if file_exists("usuario" + string(idw) + ".ini") {
                            file_delete("usuario" + string(idw) + ".ini")
                        }
                        show_message("Sorry, su ID de usuario estaba duplicado (Tx), intente de nuevo");
                        game_end();
                        exit;
                    }
                }
                break;
            
            case 9: // solicitud de desconexion por duplicado
                if g_network == m_net_server {
                    break;
                }
                with mipropio {
                    if file_exists("usuario" + string(idweb) + ".ini") {
                        file_delete("usuario" + string(idweb) + ".ini");
                    }
                    idweb = irandom_range(1, 65535);
                }
                show_message("Sorry, su ID de usuario estaba duplicado (Rx), intente de nuevo");
                game_end();
                exit;
            
            case 1: // datos de usuarios
                s_sync_usuario(buf);
                break;
            
            case 2: // lienzo
                var idw = buffer_read(buf, buffer_u16);
                with o_lienzo {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            for (var w = 0; w < ds_grid_width(imagen); w++) {
                                for (var h = 0; h < ds_grid_height(imagen); h++) {
                                    ds_grid_set(imagen, w, h, buffer_read(buf, buffer_u32));
                                }
                            }
                            for (var w = 0; w < ds_grid_width(imagen); w++) {
                                for (var h = 0; h < ds_grid_height(imagen); h++) {
                                    ds_grid_set(transp, w, h, buffer_read(buf, buffer_u8) / 255);
                                }
                            }
                        }
                        break;
                    }
                }
                break;
            
            case 3: // pergamino
                var idw = buffer_read(buf, buffer_u16);
                with o_pergamino {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            texto = buffer_read(buf, buffer_string);
                            textote = buffer_read(buf, buffer_string);
                        }
                        break;
                    }
                }
                break;
            
            case 4: // parlante
                var idw = buffer_read(buf, buffer_u16);
                with o_parlante {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            mute = buffer_read(buf, buffer_u8);
                            if sizbuf > 10 {
                                s_limpia_parlante(id, false);
                                // obtener datos buffer
                                var id_snd = string(buffer_read(buf, buffer_u16));
                                var tot = string(buffer_read(buf, buffer_u8));
                                var act = buffer_read(buf, buffer_u8);
                                var txt = buffer_read(buf, buffer_string);
                                // actualizar cabecera
                                if ds_list_empty(archivo) {
                                    s_limpia_parlante(id, true);
                                    ds_list_add(archivo, id_snd);
                                    ds_list_add(archivo, tot);
                                    ds_list_add(archivo, string_repeat("0", tot));
                                    repeat tot {
                                        ds_list_add(archivo, "");
                                    }
                                }
                                else if ds_list_find_value(archivo, 0) != id_snd {
                                    s_limpia_parlante(id, true);
                                    ds_list_add(archivo, id_snd);
                                    ds_list_add(archivo, tot);
                                    ds_list_add(archivo, string_repeat("0", tot));
                                    repeat tot {
                                        ds_list_add(archivo, "");
                                    }
                                }
                                // poner tramo respectivo
                                ds_list_replace(archivo, 3 + act, txt);
                                var flags = ds_list_find_value(archivo, 2);
                                flags = string_set_byte_at(flags, act + 1, ord("1"));
                                ds_list_replace(archivo, 2, flags);
                                // verificar si esta completo
                                if s_parlante_okey(id) {
                                    hubo_cambio = true;
                                    fecha = fec;
                                }
                            }
                            else {
                                fecha = fec;
                                s_limpia_parlante(id, true);
                            }
                        }
                        break;
                    }
                }
                break;
            
            case 5: // emisora
                var idw = buffer_read(buf, buffer_u16);
                with o_emisora {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            texto = buffer_read(buf, buffer_string);
                        }
                        break;
                    }
                }
                break;
            
            case 6: // nota musical
                var idw = buffer_read(buf, buffer_u16);
                with o_piano {
                    if idweb == idw {
                        var nota = buffer_read(buf, buffer_u8);
                        s_piano_nota(id, nota, false);
                        break;
                    }
                }
                break;
            
            case 7: // piano
                var idw = buffer_read(buf, buffer_u16);
                with o_piano {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            mute = buffer_read(buf, buffer_u8);
                            ds_list_clear(melodia);
                            aguja = 0;
                            var tot = buffer_read(buf, buffer_u16);
                            for (var i = 0; i < tot; i++) {
                                ds_list_add(melodia, buffer_read(buf, buffer_u8));
                            }
                        }
                        break;
                    }
                }
                break;
            
            case 8: // monumento
                var idw = buffer_read(buf, buffer_u16);
                with o_monumento {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32)
                        if fec > fecha {
                            fecha = fec;
                            imagenpng = buffer_read(buf, buffer_string);
                            mibandera = buffer_read(buf, buffer_u8);
                            s_actualiza_monumento(id);
                        }
                        break;
                    }
                }
                break;
            
            case 10: // escritos
                var idw = buffer_read(buf, buffer_u16);
                with o_escritos {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            for (var i = 0; i < ds_list_size(textos); i++) {
                                ds_list_replace(textos, i, buffer_read(buf, buffer_string));
                            }
                        }
                        break;
                    }
                }
                break;
            
            case 11: // tablero
                var idw = buffer_read(buf, buffer_u16);
                with o_tablero {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            for (var w = 0; w < ds_grid_width(imagen); w++) {
                                for (var h = 0; h < ds_grid_height(imagen); h++) {
                                    ds_grid_set(imagen, w, h, buffer_read(buf, buffer_u8));
                                }
                            }
                        }
                        break;
                    }
                }
                break;
            
            case 12: // diccionario
                var idw = buffer_read(buf, buffer_u16);
                with o_diccionario {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            aguja = buffer_read(buf, buffer_u8);
                            var ww = ds_grid_width(imagen);
                            var hh = ds_grid_height(imagen);
                            var lnz = ds_grid_create(ww, hh);
                            for (var i = 0; i < ds_list_size(titulos); i++) {
                                ds_list_replace(titulos, i, buffer_read(buf, buffer_string));
                                ds_list_replace(infos, i, buffer_read(buf, buffer_string));
                                if buffer_read(buf, buffer_u8) == 0 {
                                    ds_list_replace(fotos, i, "");
                                }
                                else {
                                    for (var w = 0; w < ww; w++) {
                                        for (var h = 0; h < hh; h++) {
                                            ds_grid_set(lnz, w, h, buffer_read(buf, buffer_u8));
                                        }
                                    }
                                    ds_list_replace(fotos, i, ds_grid_write(lnz));
                                }
                            }
                            ds_grid_destroy(lnz);
                            s_diccionario_aguja(id);
                        }
                        break;
                    }
                }
                break;
            
            case 13: // cambia hoja diccionario
                var idw = buffer_read(buf, buffer_u16);
                with o_diccionario {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            aguja = buffer_read(buf, buffer_u8);
                            s_diccionario_aguja(id);
                        }
                        break;
                    }
                }
                break;
            
            case 14: // biblioteca
                var idw = buffer_read(buf, buffer_u16);
                with o_biblioteca {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32); // fecha general inutil
                        var aract = buffer_read(buf, buffer_u8);
                        var fecact = buffer_read(buf, buffer_u32);
                        if fecact > fechas[aract] {
                            var aux = ds_list_find_value(archivos, aract);
                            if sizbuf > 14 {
                                // obtener datos buffer
                                var namef = string(buffer_read(buf, buffer_string));
                                var tot = string(buffer_read(buf, buffer_u8));
                                var act = buffer_read(buf, buffer_u8);
                                var txt = buffer_read(buf, buffer_string);
                                // actualizar cabecera
                                if ds_list_empty(aux) {
                                    ds_list_add(aux, namef);
                                    ds_list_add(aux, tot);
                                    ds_list_add(aux, string_repeat("0", tot));
                                    repeat tot {
                                        ds_list_add(aux, "");
                                    }
                                }
                                else if ds_list_find_value(aux, 0) != namef {
                                    ds_list_clear(aux);
                                    ds_list_add(aux, namef);
                                    ds_list_add(aux, tot);
                                    ds_list_add(aux, string_repeat("0", tot));
                                    repeat tot {
                                        ds_list_add(aux, "");
                                    }
                                }
                                // poner tramo respectivo
                                ds_list_replace(aux, 3 + act, txt);
                                var flags = ds_list_find_value(aux, 2);
                                flags = string_set_byte_at(flags, act + 1, ord("1"));
                                ds_list_replace(aux, 2, flags);
                                // verificar completud
                                if string_count("1", ds_list_find_value(aux, 2)) ==
                                        real(ds_list_find_value(aux, 1)) {
                                    fechas[aract] = fecact;
                                    fecha = s_minmax_vec(fechas, true);
                                }
                            }
                            else {
                                fechas[aract] = fecact;
                                fecha = s_minmax_vec(fechas, true);
                                ds_list_clear(aux);
                            }
                        }
                        break;
                    }
                }
                break;
            
            case 15: // presentacion
                var idw = buffer_read(buf, buffer_u16);
                with o_presentacion {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            aguja = buffer_read(buf, buffer_u8);
                            ds_list_clear(fotos);
                            if aguja != 255 {
                                var tot = buffer_read(buf, buffer_u8);
                                var ww = ds_grid_width(imagen);
                                var hh = ds_grid_height(imagen);
                                var lnz = ds_grid_create(ww, hh);
                                for (var i = 0; i < tot; i++) {
                                    for (var w = 0; w < ww; w++) {
                                        for (var h = 0; h < hh; h++) {
                                            ds_grid_set(lnz, w, h, buffer_read(buf, buffer_u8));
                                        }
                                    }
                                    ds_list_add(fotos, ds_grid_write(lnz));
                                }
                                ds_grid_destroy(lnz);
                            }
                            s_presentacion_aguja(id);
                        }
                        break;
                    }
                }
                break;
            
            case 16: // correo
                with o_virtual_correo {
                    var fec = buffer_read(buf, buffer_u32);
                    if fec > fecha {
                        fecha = fec;
                        var tot = buffer_read(buf, buffer_u16);
                        ds_list_clear(mensajes);
                        ds_list_clear(emisores);
                        ds_list_clear(receptores);
                        ds_list_clear(fechas);
                        for (var i = 0; i < tot; i++) {
                            ds_list_add(mensajes, buffer_read(buf, buffer_string));
                            ds_list_add(emisores, buffer_read(buf, buffer_u16));
                            ds_list_add(receptores, buffer_read(buf, buffer_u16));
                            ds_list_add(fechas, buffer_read(buf, buffer_u32));
                        }
                    }
                }
                break;
            
            case 17: // mute parlante
                var idw = buffer_read(buf, buffer_u16);
                with o_parlante {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            if s_parlante_okey(id) {
                                fecha = fec;
                                mute = buffer_read(buf, buffer_u8);
                            }
                        }
                        break;
                    }
                }
                break;
            
            case 18: // confesionario
                var idw = buffer_read(buf, buffer_u16);
                with o_confesionario {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            leido = buffer_read(buf, buffer_u8);
                            futuro = buffer_read(buf, buffer_u32);
                            for (var i = 0; i < ds_list_size(textos); i++) {
                                ds_list_replace(textos, i, buffer_read(buf, buffer_string));
                            }
                        }
                        break;
                    }
                }
                break;
            
            case 19: // usuario desconectado, solo movimiento
                var idw = buffer_read(buf, buffer_u16);
                with o_usuario {
                    if idweb == idw {
                        if !estaonline {
                            posx = buffer_read(buf, buffer_u16);
                            posy = buffer_read(buf, buffer_u16);
                        }
                        break;
                    }
                }
                break;
            
            case 20: // tarot
                var idw = buffer_read(buf, buffer_u16);
                with o_tarot {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            for (var i = 0; i < 3; i++) {
                                carta[i] = buffer_read(buf, buffer_u8);
                            }
                        }
                        break;
                    }
                }
                break;
            
            case 21: // ahorcado
                var idw = buffer_read(buf, buffer_u16);
                with o_ahorcado {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            palabra = buffer_read(buf, buffer_string);
                            adivinada = buffer_read(buf, buffer_string);
                            vidas = buffer_read(buf, buffer_u8);
                            historial = buffer_read(buf, buffer_string);
                        }
                        break;
                    }
                }
                break;
            
            case 22: // juegovida
                var idw = buffer_read(buf, buffer_u16);
                with o_juegovida {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            regla[0] = buffer_read(buf, buffer_string);
                            regla[1] = buffer_read(buf, buffer_string);
                            for (var w = 0; w < ds_grid_width(est_nex); w++) {
                                for (var h = 0; h < ds_grid_height(est_nex); h++) {
                                    ds_grid_set(entrante, w, h, buffer_read(buf, buffer_u8));
                                }
                            }
                        }
                        break;
                    }
                }
                break;
            
            case 23: // pipati
                var idw = buffer_read(buf, buffer_u16);
                with o_pipati {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            jugador_a = buffer_read(buf, buffer_u8);
                            jugador_b = buffer_read(buf, buffer_u8);
                        }
                        break;
                    }
                }
                break;
            
            case 24: // nivel
                var idw = buffer_read(buf, buffer_u16);
                with o_nivel {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            angulo = buffer_read(buf, buffer_u16);
                            for (var w = 0; w < ds_grid_width(imagen); w++) {
                                for (var h = 0; h < ds_grid_height(imagen); h++) {
                                    ds_grid_set(imagen, w, h, buffer_read(buf, buffer_u8));
                                }
                            }
                            alarm[1] = 1;
                        }
                        break;
                    }
                }
                break;
            
            case 25: // signal
                var idw = buffer_read(buf, buffer_u16);
                with o_signal {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            tipo = buffer_read(buf, buffer_u8);
                            amplitud = buffer_read(buf, buffer_u8);
                            frecuencia = buffer_read(buf, buffer_u8);
                            desfase = buffer_read(buf, buffer_u8);
                        }
                        break;
                    }
                }
                break;
            
            case 26: // planetario
                var idw = buffer_read(buf, buffer_u16);
                with o_planetario {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            velocidad = (buffer_read(buf, buffer_u8) / 255) * 10;
                        }
                        break;
                    }
                }
                break;
            
            case 27: // digital
                var idw = buffer_read(buf, buffer_u16);
                with o_digital {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            mute = buffer_read(buf, buffer_u8);
                            var yop = id;
                            with o_dispo {
                                if origen == yop {
                                    instance_destroy();
                                }
                            }
                            var tot = buffer_read(buf, buffer_u8);
                            var aux, xx, yy;
                            repeat tot {
                                xx = buffer_read(buf, buffer_u16);
                                yy = buffer_read(buf, buffer_u16);
                                aux = instance_create(xx, yy, o_dispo);
                                aux.name = buffer_read(buf, buffer_u8);
                                aux.tipo = buffer_read(buf, buffer_u8);
                                aux.valor = buffer_read(buf, buffer_u8);
                                for (var i = 0; i < 3; i++) {
                                    aux.vecina[i] = buffer_read(buf, buffer_u8);
                                }
                                aux.origen = yop;
                            }
                        }
                        break;
                    }
                }
                break;
            
            case 28: // bala
                var xx = buffer_read(buf, buffer_u16);
                var yy = buffer_read(buf, buffer_u16);
                var dd = buffer_read(buf, buffer_u16);
                var idw = buffer_read(buf, buffer_u16);
                var gr = buffer_read(buf, buffer_u8);
                s_crea_bala(xx, yy, dd, idw, gr, false);
                break;
            
            case 29: // recibe lista de conectados desde otro usuario
                var tot = buffer_read(buf, buffer_u16);
                var ip, idw, prio;
                if g_network == m_net_peer {
                    repeat tot {
                        ip = buffer_read(buf, buffer_string);
                        idw = buffer_read(buf, buffer_u16);
                        prio = buffer_read(buf, buffer_f32);
                        // enviar un hola
                        if ds_list_find_index(conectados, ip) == -1 {
                            network_enviados++;
                            network_env_bytes += saludo_size + m_head_udp;
                            network_send_udp_raw(conexion, ip, m_web, saludo_buf, saludo_size);
                        }
                    }
                }
                else { // client
                    var ok = false;
                    for (var i = ds_list_size(conectados) - 1; i > 0; i--) {
                        if ds_list_find_value(esserver, i) {
                            ok = true;
                        }
                        else {
                            ds_priority_delete_value(prioridad,
                                ds_list_find_value(idconectados, i));
                            ds_list_delete(tiempomuerto, i);
                            ds_list_delete(conectados, i);
                            ds_list_delete(idconectados, i);
                            ds_list_delete(esserver, i);
                        }
                    }
                    if ok {
                        repeat tot {
                            ip = buffer_read(buf, buffer_string);
                            idw = buffer_read(buf, buffer_u16);
                            prio = buffer_read(buf, buffer_f32);
                            ds_list_add(conectados, ip);
                            ds_list_add(idconectados, idw);
                            ds_list_add(tiempomuerto, udp_tiempomuerto);
                            ds_list_add(esserver, false);
                            ds_priority_add(prioridad, idw, prio);
                        }
                    }
                }
                break;
            
            case 30: // nota buzzer
                var xx = buffer_read(buf, buffer_u16);
                var yy = buffer_read(buf, buffer_u16);
                var ss = buffer_read(buf, buffer_u8);
                s_buzzer_nota(xx, yy, ss, false);
                break;
            
            case 31: // cultivo
                var idw = buffer_read(buf, buffer_u16);
                with o_cultivo {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            var yop = id;
                            with o_planta {
                                if origen == yop {
                                    instance_destroy();
                                }
                            }
                            var aux, xx, yy;
                            var tot = buffer_read(buf, buffer_u8);
                            repeat tot {
                                xx = buffer_read(buf, buffer_u16);
                                yy = buffer_read(buf, buffer_u16);
                                aux = instance_create(xx, yy, o_planta);
                                aux.tipo = buffer_read(buf, buffer_u8);
                                aux.vida = buffer_read(buf, buffer_u8);
                                aux.fecha = buffer_read(buf, buffer_u32);
                                aux.origen = yop;
                            }
                        }
                        break;
                    }
                }
                break;
            
            case 32: // usuarios se enganchan
                var idw = buffer_read(buf, buffer_u16);
                with o_usuario {
                    if idweb == idw and propietario {
                        if seguir_halar == noone {
                            var yop = id;
                            idw = buffer_read(buf, buffer_u16);
                            with o_usuario {
                                if idweb == idw {
                                    yop.seguir_halar = id;
                                    break;
                                }
                            }
                        }
                        break;
                    }
                }
                break;
            
            case 33: // ajedrez
                var idw = buffer_read(buf, buffer_u16);
                with o_ajedrez {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            turno = buffer_read(buf, buffer_u8);
                            turno_max = buffer_read(buf, buffer_u16);
                            for (var h = 0; h < 8; h++) {
                                for (var w = 0; w < 8; w++) {
                                    ds_grid_set(tablero, w, h, buffer_read(buf, buffer_string));
                                }
                            }
                            s_ajedrez_fichas(id);
                        }
                        break;
                    }
                }
                break;
            
            case 34: // evolutivo
                var idw = buffer_read(buf, buffer_u16);
                with o_evolutivo {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            fuerza_mutacion = buffer_read(buf, buffer_u8);
                            fuerza_recombinacion = buffer_read(buf, buffer_u8);
                            densidad_alimento = buffer_read(buf, buffer_u8);
                            num_bichos_udp = buffer_read(buf, buffer_u16);
                            for (var g = 0; g < 6; g++) {
                                gen[g] = buffer_read(buf, buffer_u8) / 255;
                            }
                        }
                        break;
                    }
                }
                break;
            
            case 35: // efecto de sonido
                var xx = buffer_read(buf, buffer_u16);
                var yy = buffer_read(buf, buffer_u16);
                var ss = buffer_read(buf, buffer_u16);
                s_audio(xx, yy, ss, false);
                break;
            
            case 36: // secuencia
                var idw = buffer_read(buf, buffer_u16);
                with o_secuencia {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            secuencia = buffer_read(buf, buffer_string);
                            intento = buffer_read(buf, buffer_string);
                            if string_length(secuencia) < ultima or
                                    string_length(intento) < repeticion {
                                ultima = 0;
                                repeticion = 0;
                                reloj_secu = o_control.secuencia_velocidad;;
                            }
                        }
                        break;
                    }
                }
                break;
            
            case 37: // parabolico
                var idw = buffer_read(buf, buffer_u16);
                with o_parabolico {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            angulo = buffer_read(buf, buffer_u8);
                            direction = buffer_read(buf, buffer_u16);
                            fuerza = buffer_read(buf, buffer_u8);
                        }
                        break;
                    }
                }
                break;
            
            case 38: // tiro parabolico
                var idw = buffer_read(buf, buffer_u16);
                with o_parabolico {
                    if idweb == idw {
                        var ang = buffer_read(buf, buffer_u8);
                        var dir = buffer_read(buf, buffer_u16);
                        var fue = buffer_read(buf, buffer_u8);
                        reloj_tiro = 0;
                        s_tiro_parabolico(id, ang, dir, fue, false);
                        break;
                    }
                }
                break;
            
            case 39: // calculadora
                var idw = buffer_read(buf, buffer_u16);
                with o_calculadora {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            pregunta = buffer_read(buf, buffer_string);
                            for (var i = 0; i < 4; i++) {
                                respuesta[i] = buffer_read(buf, buffer_string);
                            }
                            verdadera = buffer_read(buf, buffer_u8);
                            nivel = buffer_read(buf, buffer_u8);
                            puntos[0] = buffer_read(buf, buffer_u8);
                            puntos[1] = buffer_read(buf, buffer_u8);
                        }
                        break;
                    }
                }
                break;
            
            case 40: // acelerador
                var idw = buffer_read(buf, buffer_u16);
                with o_acelerador {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            activo = buffer_read(buf, buffer_u8) != 0;
                            calor_ini = buffer_read(buf, buffer_u8);
                            cadencia = buffer_read(buf, buffer_u8);
                            girar = buffer_read(buf, buffer_u8);
                            direccional = buffer_read(buf, buffer_u16);
                            disparado = buffer_read(buf, buffer_u8);
                        }
                        break;
                    }
                }
                break;
            
            case 41: // puntaje (futbol)
                var idw = buffer_read(buf, buffer_u16);
                with o_puntaje {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        var del = buffer_read(buf, buffer_f32);
                        if fec + del > fecha {
                            fecha = fec;
                            puntos[0] = buffer_read(buf, buffer_u8);
                            puntos[1] = buffer_read(buf, buffer_u8);
                            reloj_juego = buffer_read(buf, buffer_f32);
                            reloj_balon = buffer_read(buf, buffer_f32);
                            enjuego = buffer_read(buf, buffer_u8) != 0;
                            var xx = buffer_read(buf, buffer_u16);
                            var yy = buffer_read(buf, buffer_u16);
                            var dd = buffer_read(buf, buffer_u16);
                            var vv = buffer_read(buf, buffer_u16);
                            if xx == 0 and yy == 0 {
                                var yop = id;
                                with o_balon {
                                    if origen == yop {
                                        instance_destroy();
                                        break;
                                    }
                                }
                            }
                            else {
                                var yop = id;
                                var bll = noone;
                                with o_balon {
                                    if origen == yop {
                                        bll = id;
                                        break;
                                    }
                                }
                                if bll == noone {
                                    bll = instance_create(xx, yy, o_balon);
                                    bll.origen = yop;
                                }
                                bll.posx = xx;
                                bll.posy = yy;
                                bll.direcc = dd;
                                bll.velocity = vv;
                            }
                        }
                        break;
                    }
                }
                break;
            
            case 42: // batalla
                var idw = buffer_read(buf, buffer_u16);
                with o_batalla {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            var lao = ds_grid_width(barcos);
                            for (var h = 0; h < lao; h++) {
                                for (var w = 0; w < lao; w++) {
                                    ds_grid_set(barcos, w, h, buffer_read(buf, buffer_u8));
                                }
                            }
                            for (var h = 0; h < lao; h++) {
                                for (var w = 0; w < lao; w++) {
                                    ds_grid_set(tiros, w, h, buffer_read(buf, buffer_u8));
                                }
                            }
                            s_batalla_ficha();
                        }
                        break;
                    }
                }
                break;
            
            case 43: // memoria
                var idw = buffer_read(buf, buffer_u16);
                with o_memoria {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            turno = buffer_read(buf, buffer_u16);
                            ultimo[0] = buffer_read(buf, buffer_u8);
                            ultimo[1] = buffer_read(buf, buffer_u8);
                            var aux;
                            var tll = ds_grid_width(tablero);
                            for (var h = 0; h < tll; h++) {
                                for (var w = 0; w < tll; w++) {
                                    aux = ds_grid_get(tablero, w, h);
                                    aux.tipo = buffer_read(buf, buffer_u8);
                                    aux.mostrado = buffer_read(buf, buffer_u8) - 1;
                                }
                            }
                        }
                        break;
                    }
                }
                break;
            
            case 44: // virus
                var idw = buffer_read(buf, buffer_u16);
                with o_virus {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            mortandad = buffer_read(buf, buffer_u8);
                            incubacion = buffer_read(buf, buffer_u8);
                            enfermedad = buffer_read(buf, buffer_u8);
                            transmision = buffer_read(buf, buffer_u8);
                            curatodos = buffer_read(buf, buffer_u8);
                        }
                        break;
                    }
                }
                break;
            
            case 45: // infectar o curar
                var jer = buffer_read(buf, buffer_u8);
                if jer == 2 { // curar todos
                    with o_usuario {
                        salud = 0;
                    }
                }
                else {
                    var idw = buffer_read(buf, buffer_u16);
                    with o_usuario {
                        if idweb == idw {
                            if jer == 0 { // infectar
                                salud = s_current_time();
                            }
                            else if jer == 1 { // curar
                                salud = 0;
                            }
                            break;
                        }
                    }
                }
                break;
            
            case 46: // idweb + fecha gadgets
                var total = buffer_read(buf, buffer_u16);
                var idw, fec, aux;
                repeat total {
                    idw = buffer_read(buf, buffer_u16);
                    fec = buffer_read(buf, buffer_u32);
                    aux = noone;
                    with o_especial {
                        if idweb == idw {
                            aux = id;
                            break;
                        }
                    }
                    if aux == noone {
                        with o_game {
                            if idweb == idw {
                                aux = id;
                                break;
                            }
                        }
                    }
                    if aux != noone {
                        if aux.fecha > fec {
                            aux.reloj_sinc = min(1, aux.reloj_sinc);
                        }
                    }
                }
                buffer_delete(buf);
                exit;
            
            case 47: // alfombra
                var idw = buffer_read(buf, buffer_u16);
                with o_alfombra {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            for (var w = 0; w < ds_grid_width(imagen); w++) {
                                for (var h = 0; h < ds_grid_height(imagen); h++) {
                                    ds_grid_set(imagen, w, h, buffer_read(buf, buffer_u32));
                                }
                            }
                            for (var w = 0; w < ds_grid_width(imagen); w++) {
                                for (var h = 0; h < ds_grid_height(imagen); h++) {
                                    ds_grid_set(transp, w, h, buffer_read(buf, buffer_u8) / 255);
                                }
                            }
                        }
                        break;
                    }
                }
                break;
            
            case 48: // azar
                var idw = buffer_read(buf, buffer_u16);
                with o_azar {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            ganador = buffer_read(buf, buffer_u16);
                            numerito = buffer_read(buf, buffer_string);
                            dado = buffer_read(buf, buffer_u8);
                            perfil_azar = noone;
                        }
                        break;
                    }
                }
                break;
            
            case 49: // clima
                with o_virtual_molino {
                    var fec = buffer_read(buf, buffer_u32);
                    if fec > fecha {
                        fecha = fec;
                        for (var i = 0; i < o_control.cantidad_opiniones; i++) {
                            ds_grid_set(opinador, i, 0, buffer_read(buf, buffer_u16));
                            ds_grid_set(opinador, i, 1, buffer_read(buf, buffer_u32));
                            ds_grid_set(opinador, i, 2, buffer_read(buf, buffer_u8) - 1);
                        }
                    }
                }
                break;
            
            case 50: // votacion
                var idw = buffer_read(buf, buffer_u16);
                with o_votacion {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            var lon = buffer_read(buf, buffer_u16);
                            ds_list_clear(derecha);
                            repeat lon {
                                ds_list_add(derecha, buffer_read(buf, buffer_u16));
                            }
                            lon = buffer_read(buf, buffer_u16);
                            ds_list_clear(izquierda);
                            repeat lon {
                                ds_list_add(izquierda, buffer_read(buf, buffer_u16));
                            }
                            pregunta = buffer_read(buf, buffer_string);
                        }
                        break;
                    }
                }
                break;
            
            case 51: // examen
                var idw = buffer_read(buf, buffer_u16);
                with o_examen {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            var tot = buffer_read(buf, buffer_u8);
                            ds_list_clear(preguntas);
                            repeat tot {
                                ds_list_add(preguntas, buffer_read(buf, buffer_string));
                            }
                            tot = buffer_read(buf, buffer_u8);
                            ds_list_clear(estudiantes);
                            ds_list_clear(notas);
                            repeat tot {
                                ds_list_add(estudiantes, buffer_read(buf, buffer_u16));
                                ds_list_add(notas, buffer_read(buf, buffer_u8));
                            }
                            s_notas(id);
                        }
                        break;
                    }
                }
                break;
            
            case 52: // encuesta
                var idw = buffer_read(buf, buffer_u16);
                with o_encuesta {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            var tot = buffer_read(buf, buffer_u8);
                            ds_list_clear(preguntas);
                            repeat tot {
                                ds_list_add(preguntas, buffer_read(buf, buffer_string));
                            }
                            tot = buffer_read(buf, buffer_u8);
                            ds_list_clear(estudiantes);
                            repeat tot {
                                ds_list_add(estudiantes, buffer_read(buf, buffer_u16));
                            }
                            ds_list_clear(respuestas);
                            repeat o_control.encuesta_max {
                                ds_list_add(respuestas, buffer_read(buf, buffer_u16));
                            }
                            genero = buffer_read(buf, buffer_u16);
                            s_respuestas(id);
                        }
                        break;
                    }
                }
                break;
            
            case 53: // criaturas
                var idw, tk, fec, xx, yy, mx, my, rq, rm;
                repeat o_control.kreaturas {
                    idw = buffer_read(buf, buffer_u16);
                    fec = buffer_read(buf, buffer_u32);
                    xx = buffer_read(buf, buffer_u16);
                    yy = buffer_read(buf, buffer_u16);
                    mx = buffer_read(buf, buffer_u16);
                    my = buffer_read(buf, buffer_u16);
                    rq = buffer_read(buf, buffer_u32);
                    rm = buffer_read(buf, buffer_u32);
                    tk = buffer_read(buf, buffer_u8);
                    with o_kreature {
                        if idweb == idw {
                            if fec >= fechamove {
                                fechamove = fec;
                                posx = xx;
                                posy = yy;
                                metax = mx;
                                metay = my;
                                reloj_quiet = rq;
                                reloj_move = rm;
                                tipok = tk;
                            }
                            break;
                        }
                    }
                }
                break;
            
            case 54: // criatura
                var idw = buffer_read(buf, buffer_u16);
                with o_kreature {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            tipok = buffer_read(buf, buffer_u8);
                        }
                        break;
                    }
                }
                break;
            
            case 55: // anatomia
                var idw = buffer_read(buf, buffer_u16);
                with o_anatomia {
                    if idweb == idw {
                        var fec = buffer_read(buf, buffer_u32);
                        if fec > fecha {
                            fecha = fec;
                            intensidad = buffer_read(buf, buffer_u8);
                        }
                        break;
                    }
                }
                break;
            
            case 56: // cambia objeto usuario
                var idw = buffer_read(buf, buffer_u16);
                with o_usuario {
                    if idweb == idw {
                        objeto = buffer_read(buf, buffer_u16);
                        break;
                    }
                }
                break;
            
            case 57: // numero
                var xx = buffer_read(buf, buffer_u16);
                var yy = buffer_read(buf, buffer_u16);
                var ss = buffer_read(buf, buffer_string);
                s_numero(xx, yy, ss, false);
                break;
            
            case 58: // globo
                var idw = buffer_read(buf, buffer_u16);
                with o_usuario {
                    if idweb == idw {
                        objeto = 0;
                        var aux = instance_create(x, y + 1, o_globo);
                        aux.esconfeti = buffer_read(buf, buffer_u8) == 1;
                        if aux.esconfeti {
                            s_audio(x, y, a_rocket, false);
                        }
                        break;
                    }
                }
                break;
            
            case 59: // pinturas
                var tot = buffer_read(buf, buffer_u16);
                var xx, yy, aux;
                repeat tot {
                    xx = buffer_read(buf, buffer_u16);
                    yy = buffer_read(buf, buffer_u16);
                    aux = instance_create(xx, yy, o_pintura);
                    aux.colorid = buffer_read(buf, buffer_u8);
                    s_pintura(aux);
                }
                break;
        }
        // retransmitir los paquetes a los demas usuarios
        if g_network == m_net_server {
            switch tt_tt {
                case 1: // datos de usuarios
                case 6: // nota musical
                case 17: // mute parlante
                case 13: // cambia hoja diccionario
                case 16: // correo
                case 19: // usuario desconectado, solo movimiento
                case 21: // ahorcado
                case 23: // pipati
                case 28: // bala
                case 30: // nota buzzer
                case 32: // usuarios se enganchan
                case 33: // ajedrez
                case 35: // efecto sonido
                case 36: // secuencia
                case 39: // calculadora
                case 42: // batalla
                case 41: // puntaje (futbol)
                case 43: // memoria
                case 45: // infectar o curar
                case 54: // criatura
                case 56: // cambia objeto usuario
                case 57: // numero
                case 58: // globo
                case 59: // pinturas
                    s_udp_rebote(buf, la_ip);
                    break;
            }
        }
    }
}
buffer_delete(buf);


