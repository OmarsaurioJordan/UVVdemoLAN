//s_recv_ofihttp(id);
if ds_map_find_value(async_load, "status") == 0 {
    var txt = s_split(ds_map_find_value(async_load, "result"), "|", false);
    if is_array(txt) {
        if array_length_1d(txt) == 3 {
            if txt[0] = m_http {
                if s_str_es_ip_msk(txt[1]) {
                    mascvlan = txt[1];
                }
                if s_str_es_ip(txt[2]) {
                    network_send_udp_raw(conexion, txt[2], m_web, saludo_buf, saludo_size);
                }
            }
        }
    }
}


