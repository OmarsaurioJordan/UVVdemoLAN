if propietario {
    keyboard_clear(vk_shift);
    keyboard_clear(vk_control);
    switch ds_map_find_value(async_load, "id") {
        case dial_usr_web:
            dial_usr_web = -1;
            if ds_map_find_value(async_load, "status") {
                if en_mira != noone {
                    if s_url(en_mira.contacto) {
                        execute_shell_simple(en_mira.contacto);
                    }
                }
            }
            break;
        case dial_panfleto:
            dial_panfleto = -1;
            if ds_map_find_value(async_load, "status") {
                var res = string_replace(ds_map_find_value(async_load, "result"), "#", "");
                dia_panfleto = s_current_time();
                while string_width(string_hash_to_newline(res)) * 0.7 > 64 {
                    res = string_copy(res, 1, string_length(res) - 1);
                }
                panfleto = res;
            }
            break;
        case dial_registro:
            dial_registro = -1;
            if ds_map_find_value(async_load, "status") {
                switch tipo_registro {
                    case 1: // nombre
                        var res = string_replace(ds_map_find_value(async_load, "result"), "#", "");
                        res = s_string_letters_digits(res);
                        if res != "" {
                            while string_width(string_hash_to_newline(res)) * 0.8 > 72 {
                                res = string_copy(res, 1, string_length(res) - 1);
                            }
                            nombre = res;
                            nombremas = s_letters_digits_lower(nombre);
                            registro = s_current_time();
                            s_nombre_unico(id);
                        }
                        break;
                    case 5: // year nacimiento
                        var res = ds_map_find_value(async_load, "result");
                        edad = clamp(round(res), 1900, current_year - 1);
                        break;
                    case 8: // descripcion
                        var res = ds_map_find_value(async_load, "result");
                        while string_height_ext(string_hash_to_newline(res), 13, 128) * 0.6 > 80 or
                                string_width_ext(string_hash_to_newline(res), 13, 128) * 0.6 > 72 {
                            res = string_copy(res, 1, string_length(res) - 1);
                        }
                        descripcion = res;
                        break;
                    case 9: // contacto
                        var res = ds_map_find_value(async_load, "result");
                        contacto = string_copy(res, 1, min(string_length(res), 255));
                        break;
                    case 0: // hashtag
                        var res = string_replace(ds_map_find_value(async_load, "result"), "#", "");
                        while string_width(string_hash_to_newline(res)) * 0.7 > 72 {
                            res = string_copy(res, 1, string_length(res) - 1);
                        }
                        hashtag = res;
                        elhashtagmin = s_letters_digits_lower(hashtag);
                        break;
                    case 80: // biografia
                        var res = ds_map_find_value(async_load, "result");
                        while string_height_ext(string_hash_to_newline(res), 13, 232 * 1.5) * 0.6 > 172 * 1.5 or
                                string_width_ext(string_hash_to_newline(res), 13, 232 * 1.5) * 0.6 > 150 * 1.5 {
                            res = string_copy(res, 1, string_length(res) - 1);
                        }
                        biografia = res;
                        break;
                }
            }
            break;
        case dial_especial:
            dial_especial = -1;
            if ds_map_find_value(async_load, "status") {
                if !instance_exists(tipo_especial) {
                    exit;
                }
                switch tipo_especial.object_index {
                    
                    case o_pergamino:
                        var res = ds_map_find_value(async_load, "result");
                        if tipo_especial.redacta == 0 {
                            while string_height_ext(string_hash_to_newline(res), 13, 128) * 0.6 > 72 or
                                    string_width_ext(string_hash_to_newline(res), 13, 128) * 0.6 > 72 {
                                res = string_copy(res, 1, string_length(res) - 1);
                            }
                            tipo_especial.texto = res;
                            tipo_especial.fecha = s_current_time();
                            tipo_especial.reloj_sinc = 0;
                        }
                        else {
                            while string_height_ext(string_hash_to_newline(res), 13, 232 * 1.5) * 0.6 > 172 * 1.5 or
                                    string_width_ext(string_hash_to_newline(res), 13, 232 * 1.5) * 0.6 > 150 * 1.5 {
                                res = string_copy(res, 1, string_length(res) - 1);
                            }
                            tipo_especial.textote = res;
                            tipo_especial.fecha = s_current_time();
                            tipo_especial.reloj_sinc = 0;
                        }
                        break;
                    
                    case o_emisora:
                        var res = string_replace(ds_map_find_value(async_load, "result"), "#", "");
                        while string_height_ext(string_hash_to_newline(res), 13, 90) * 0.6 > 50 or
                                string_width_ext(string_hash_to_newline(res), 13, 90) * 0.6 > 64 {
                            res = string_copy(res, 1, string_length(res) - 1);
                        }
                        tipo_especial.texto = res;
                        tipo_especial.fecha = s_current_time();
                        tipo_especial.reloj_sinc = 0;
                        break;
                    
                    case o_piano:
                        var res = string_lower(ds_map_find_value(async_load, "result"));
                        var nts = "";
                        var r;
                        while res != "" {
                            r = string_char_at(res, 1);
                            if nts == "" and string_count(r, "0123456789") != 0 {
                                nts += r;
                            }
                            else if string_count(r, "01234567") != 0 {
                                nts += r;
                            }
                            else if string_count(r, " _zxcvbnm") != 0 {
                                switch r {
                                    case " ": nts += "0"; break;
                                    case "_": nts += "0"; break;
                                    case "z": nts += "1"; break;
                                    case "x": nts += "2"; break;
                                    case "c": nts += "3"; break;
                                    case "v": nts += "4"; break;
                                    case "b": nts += "5"; break;
                                    case "n": nts += "6"; break;
                                    case "m": nts += "7"; break;
                                }
                            }
                            if string_length(res) <= 1 {
                                break;
                            }
                            res = string_copy(res, 2, string_length(res) - 1);
                        }
                        nts = string_copy(nts, 1, min(string_length(nts), 64000));
                        if string_length(nts) >= 2 {
                            ds_list_clear(tipo_especial.melodia);
                            tipo_especial.aguja = 0;
                            while nts != "" {
                                ds_list_add(tipo_especial.melodia, real(string_char_at(nts, 1)));
                                if string_length(nts) <= 1 {
                                    break;
                                }
                                nts = string_copy(nts, 2, string_length(nts) - 1);
                            }
                            tipo_especial.fecha = s_current_time();
                            tipo_especial.reloj_sinc = 0;
                            tipo_especial.mute = 0;
                        }
                        break;
                    
                    case o_antena:
                        var res = ds_map_find_value(async_load, "result");
                        if s_str_es_ip(res) {
                            with o_control {
                                network_enviados++;
                                network_env_bytes += saludo_size + m_head_udp;
                                network_send_udp_raw(conexion, res, m_web, saludo_buf, saludo_size);
                            }
                        }
                        break;
                    
                    case o_escritos:
                        var res = ds_map_find_value(async_load, "result");
                        while string_height_ext(string_hash_to_newline(res), 13, 232 * 1.5) * 0.6 > 172 * 1.5 or
                                string_width_ext(string_hash_to_newline(res), 13, 232 * 1.5) * 0.6 > 150 * 1.5 {
                            res = string_copy(res, 1, string_length(res) - 1);
                        }
                        ds_list_replace(tipo_especial.textos, tipo_especial.aguja, res);
                        tipo_especial.fecha = s_current_time();
                        tipo_especial.reloj_sinc = 0;
                        break;
                    
                    case o_baul:
                        var res = ds_map_find_value(async_load, "result");
                        objeto = clamp(round(res), 0, sprite_get_number(d_objeto) - 1);
                        //s_objeto_prohibido(id, true);
                        break;
                    
                    case o_diccionario:
                        switch tipo_especial.orden_mensaje {
                            case 0: // pagina
                                var res = ds_map_find_value(async_load, "result");
                                tipo_especial.aguja = clamp(round(res), 0,
                                    ds_list_size(tipo_especial.titulos) - 1);
                                s_diccionario_aguja(tipo_especial);
                                tipo_especial.fecha = s_current_time();
                                tipo_especial.reloj_sinc = 0;
                                tipo_especial.solo_aguja = true;
                                break;
                            case 1: // titulo
                                var res = string_replace(ds_map_find_value(async_load, "result"), "#", "");
                                while string_width(string_hash_to_newline(res)) * 0.7 > 50 {
                                    res = string_copy(res, 1, string_length(res) - 1);
                                }
                                ds_list_replace(tipo_especial.titulos, tipo_especial.aguja, res);
                                tipo_especial.fecha = s_current_time();
                                tipo_especial.reloj_sinc = 0;
                                tipo_especial.solo_aguja = false;
                                break;
                            case 2: // informacion
                                var res = ds_map_find_value(async_load, "result");
                                while string_height_ext(string_hash_to_newline(res), 13, 85) * 0.6 > 64 or
                                        string_width_ext(string_hash_to_newline(res), 13, 85) * 0.6 > 48 {
                                    res = string_copy(res, 1, string_length(res) - 1);
                                }
                                ds_list_replace(tipo_especial.infos, tipo_especial.aguja, res);
                                if res != "" {
                                    ds_list_replace(tipo_especial.fotos, tipo_especial.aguja, "");
                                    s_diccionario_aguja(tipo_especial);
                                }
                                tipo_especial.fecha = s_current_time();
                                tipo_especial.reloj_sinc = 0;
                                tipo_especial.solo_aguja = false;
                                break;
                        }
                        break;
                    
                    case o_correo:
                        var mail = o_virtual_correo.id;
                        var res = s_split(ds_map_find_value(async_load, "result"), "|", false);
                        if is_array(res) {
                            if array_length_1d(res) == 2 {
                                // buscar si existe el receptor
                                var quien = s_busca_pornombre(res[0]);
                                if quien == -1 {
                                    break;
                                }
                                else {
                                    with o_usuario {
                                        if quien == idweb {
                                            if bloqueado {
                                                quien = -1;
                                            }
                                            break;
                                        }
                                    }
                                    if quien == -1 {
                                        break;
                                    }
                                }
                                // limitar la talla del mensaje, igual que con escritos
                                if res[1] != "" {
                                    res[1] = string_copy(res[1], 1, min(200, string_length(res[1])));
                                }
                                while string_height_ext(string_hash_to_newline(s_formato_mail_raw(res[1])),
                                        13, 232 * 1.5) * 0.6 > 172 * 1.5 or
                                        string_width_ext(string_hash_to_newline(s_formato_mail_raw(res[1])),
                                        13, 232 * 1.5) * 0.6 > 150 * 1.5 {
                                    res[1] = string_copy(res[1], 1, string_length(res[1]) - 1);
                                }
                                // ver que hacer con el mensaje
                                var ok = false;
                                if res[1] == "" {
                                    // buscar si existe el mensaje en cola para eliminarlo
                                    for (var i = 0; i < ds_list_size(mail.mensajes); i++) {
                                        if ds_list_find_value(mail.emisores, i) == idweb and
                                                ds_list_find_value(mail.receptores, i) == quien {
                                            ds_list_delete(mail.mensajes, i);
                                            ds_list_delete(mail.emisores, i);
                                            ds_list_delete(mail.receptores, i);
                                            ds_list_delete(mail.fechas, i);
                                            ok = true;
                                            break;
                                        }
                                    }
                                }
                                else {
                                    // buscar si existe el mensaje para modificarlo
                                    for (var i = 0; i < ds_list_size(mail.mensajes); i++) {
                                        if ds_list_find_value(mail.emisores, i) == idweb and
                                                ds_list_find_value(mail.receptores, i) == quien {
                                            ds_list_replace(mail.mensajes, i, res[1]);
                                            ds_list_replace(mail.fechas, i, s_current_time());
                                            ok = true;
                                            break;
                                        }
                                    }
                                    if !ok {
                                        ok = true;
                                        // ver si hay demasiados mensajes, reemplazar antiguo
                                        if ds_list_size(mail.mensajes) >= o_control.limite_correos {
                                            var antik = 0;
                                            var minim = s_current_time();
                                            var mn;
                                            for (var i = 0; i < ds_list_size(mail.mensajes); i++) {
                                                mn = ds_list_find_value(mail.fechas, i);
                                                if mn <= minim {
                                                    minim = mn;
                                                    antik = i;
                                                }
                                            }
                                            ds_list_replace(mail.mensajes, antik, res[1]);
                                            ds_list_replace(mail.emisores, antik, idweb);
                                            ds_list_replace(mail.receptores, antik, quien);
                                            ds_list_replace(mail.fechas, antik, s_current_time());
                                        }
                                        else {
                                            // incrustar el mensaje en la cola
                                            ds_list_add(mail.mensajes, res[1]);
                                            ds_list_add(mail.emisores, idweb);
                                            ds_list_add(mail.receptores, quien);
                                            ds_list_add(mail.fechas, s_current_time());
                                        }
                                    }
                                }
                                // actualizar sincronizacion
                                if ok {
                                    mail.fecha = s_current_time();
                                    mail.reloj_sinc = 0;
                                }
                            }
                        }
                        break;
                    
                    case o_confesionario:
                        for (var t = 1; t < ds_list_size(tipo_especial.textos); t++) {
                            if ds_list_find_value(tipo_especial.textos, t) == "" {
                                var res = ds_map_find_value(async_load, "result");
                                while string_height_ext(string_hash_to_newline(res), 13, 232 * 1.5) * 0.6 > 172 * 1.5 or
                                        string_width_ext(string_hash_to_newline(res), 13, 232 * 1.5) * 0.6 > 150 * 1.5 {
                                    res = string_copy(res, 1, string_length(res) - 1);
                                }
                                ds_list_replace(tipo_especial.textos, t, res);
                                tipo_especial.fecha = s_current_time();
                                tipo_especial.reloj_sinc = 0;
                                tipo_especial.futuro = s_current_time() + irandom_range(
                                    o_control.confesion_futuro_min,
                                    o_control.confesion_futuro_max) /
                                    o_control.relojes_acelerados;
                                break;
                            }
                        }
                        break;
                    
                    case o_ahorcado:
                        if tipo_especial.vidas > 0 and tipo_especial.palabra != tipo_especial.adivinada {
                            var res = s_string_letters_lower(ds_map_find_value(async_load, "result"));
                            if tipo_especial.palabra == "" {
                                s_ahorcado_reinicia(tipo_especial);
                                if res != "" {
                                    tipo_especial.palabra = string_copy(res, 1, min(o_control.limite_ahorcado, string_length(res)));
                                    tipo_especial.adivinada = string_repeat("-", string_length(tipo_especial.palabra));
                                }
                                tipo_especial.fecha = s_current_time();
                                tipo_especial.reloj_sinc = 0;
                                exit;
                            }
                            with tipo_especial {
                                var ok = false;
                                if string_length(res) == 1 {
                                    var newad = "";
                                    var v, p;
                                    for (var c = 1; c <= string_length(palabra); c++) {
                                        v = string_char_at(adivinada, c);
                                        p = string_char_at(palabra, c);
                                        if v != "-" {
                                            newad += v;
                                        }
                                        else if p == res {
                                            newad += p;
                                        }
                                        else {
                                            newad += "-";
                                        }
                                    }
                                    if newad != adivinada {
                                        historial += res;
                                        adivinada = newad;
                                        ok = true;
                                    }
                                    else {
                                        if string_count(res, historial) == 0 {
                                            historial += res;
                                            vidas--;
                                            ok = true;
                                        }
                                    }
                                }
                                else if res != "" {
                                    ok = true;
                                    if res == palabra {
                                        adivinada = res;
                                    }
                                    else {
                                        vidas--;
                                    }
                                }
                                if ok {
                                    fecha = s_current_time();
                                    reloj_sinc = 0;
                                }
                            }
                        }
                        break;
                    
                    case o_dispo:
                        var res = ds_map_find_value(async_load, "result");
                        if res != "" {
                            res = s_split(res, "|", false);
                            if is_array(res) {
                                if array_length_1d(res) == 3 {
                                    for (var i = 0; i < 3; i++) {
                                        res[i] = string_digits(res[i]);
                                        if res[i] == "" {
                                            res[i] = 255;
                                        }
                                        else {
                                            res[i] = clamp(round(real(res[i])), 0, 255);
                                        }
                                        tipo_especial.vecina[i] = res[i];
                                    }
                                    tipo_especial.alarm[0] = 1;
                                    tipo_especial.origen.fecha = s_current_time();
                                    tipo_especial.origen.reloj_sinc = 1;
                                }
                            }
                        }
                        break;
                    
                    case o_ajedrez:
                        if tipo_especial.miturno == tipo_especial.turno_max {
                            var res = string_lower(ds_map_find_value(async_load, "result"));
                            if res == "000" {
                                s_ajedrez_enrroque(tipo_especial, false);
                            }
                            else if res == "00" {
                                s_ajedrez_enrroque(tipo_especial, true);
                            }
                            else if string_length(res) == 5 {
                                var wi = -1; var hi = -1; var wf = -1; var hf = -1;
                                switch string_char_at(res, 1) {
                                    case "a": wi = 0; break;
                                    case "b": wi = 1; break;
                                    case "c": wi = 2; break;
                                    case "d": wi = 3; break;
                                    case "e": wi = 4; break;
                                    case "f": wi = 5; break;
                                    case "g": wi = 6; break;
                                    case "h": wi = 7; break;
                                }
                                switch string_char_at(res, 2) {
                                    case "8": hi = 0; break;
                                    case "7": hi = 1; break;
                                    case "6": hi = 2; break;
                                    case "5": hi = 3; break;
                                    case "4": hi = 4; break;
                                    case "3": hi = 5; break;
                                    case "2": hi = 6; break;
                                    case "1": hi = 7; break;
                                }
                                switch string_char_at(res, 4) {
                                    case "a": wf = 0; break;
                                    case "b": wf = 1; break;
                                    case "c": wf = 2; break;
                                    case "d": wf = 3; break;
                                    case "e": wf = 4; break;
                                    case "f": wf = 5; break;
                                    case "g": wf = 6; break;
                                    case "h": wf = 7; break;
                                }
                                switch string_char_at(res, 5) {
                                    case "8": hf = 0; break;
                                    case "7": hf = 1; break;
                                    case "6": hf = 2; break;
                                    case "5": hf = 3; break;
                                    case "4": hf = 4; break;
                                    case "3": hf = 5; break;
                                    case "2": hf = 6; break;
                                    case "1": hf = 7; break;
                                }
                                if wi != -1 and hi != -1 and wf != -1 and hf != -1 {
                                    s_ajedrez_move(tipo_especial, wi, hi, wf, hf, true);
                                }
                            }
                        }
                        break;
                    
                    case o_batalla:
                        var btll = instance_furthest(tipo_especial.x, tipo_especial.y, o_batalla);
                        if s_grid_sum_val(btll.tiros, 0, false) >= s_grid_sum_val(tipo_especial.tiros, 0, false) {
                            var res = string_lower(ds_map_find_value(async_load, "result"));
                            if string_length(res) == 2 {
                                var wi = -1; var hi = -1;
                                switch string_char_at(res, 1) {
                                    case "a": wi = 0; break;
                                    case "b": wi = 1; break;
                                    case "c": wi = 2; break;
                                    case "d": wi = 3; break;
                                    case "e": wi = 4; break;
                                    case "f": wi = 5; break;
                                    case "g": wi = 6; break;
                                    case "h": wi = 7; break;
                                }
                                switch string_char_at(res, 2) {
                                    case "8": hi = 0; break;
                                    case "7": hi = 1; break;
                                    case "6": hi = 2; break;
                                    case "5": hi = 3; break;
                                    case "4": hi = 4; break;
                                    case "3": hi = 5; break;
                                    case "2": hi = 6; break;
                                    case "1": hi = 7; break;
                                }
                                var quien = ds_grid_get(btll.barcos, wi, hi);
                                if quien == 1 or quien == 2 {
                                    ds_grid_set(btll.barcos, wi, hi, 2);
                                    ds_grid_set(tipo_especial.tiros, wi, hi, 2);
                                    
                                }
                                else {
                                    ds_grid_set(btll.barcos, wi, hi, 3);
                                    ds_grid_set(tipo_especial.tiros, wi, hi, 1);
                                }
                                btll.fecha = s_current_time();
                                btll.reloj_sinc = 0;
                                tipo_especial.fecha = s_current_time();
                                tipo_especial.reloj_sinc = 0;
                                s_batalla_ficha();
                            }
                        }
                        break;
                    
                    case o_juegovida:
                        var res = ds_map_find_value(async_load, "result");
                        if res != "" {
                            res = s_split(res, "/", false);
                            if is_array(res) {
                                if array_length_1d(res) == 2 {
                                    tipo_especial.regla[0] = res[0];
                                    tipo_especial.regla[1] = res[1];
                                    tipo_especial.fecha = s_current_time();
                                    tipo_especial.reloj_sinc = 1;
                                }
                            }
                        }
                        break;
                    
                    case o_votacion:
                        var res = ds_map_find_value(async_load, "result");
                        while string_height_ext(string_hash_to_newline(res), 13, 96) * 0.6 > 48 or
                                string_width_ext(string_hash_to_newline(res), 13, 96) * 0.6 > 64 {
                            res = string_copy(res, 1, string_length(res) - 1);
                        }
                        ds_list_clear(tipo_especial.derecha);
                        ds_list_clear(tipo_especial.izquierda);
                        tipo_especial.pregunta = res;
                        tipo_especial.fecha = s_current_time();
                        tipo_especial.reloj_sinc = 0;
                        break;
                }
            }
            break;
    }
}


