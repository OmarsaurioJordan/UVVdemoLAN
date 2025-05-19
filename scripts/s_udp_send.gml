///s_udp_send(buffer, ip_excepcion);
// arg0: id de buffer, sera destruido
// arg1: string ip excepcion a envio, o ""

with o_control {
    var tll = buffer_get_size(argument0);
    if g_network == m_net_client {
        for (var i = 1; i < ds_list_size(conectados); i++) {
            if ds_list_find_value(esserver, i) {
                var ip = ds_list_find_value(conectados, i);
                network_enviados++;
                network_env_bytes += tll + m_head_udp;
                network_send_udp_raw(conexion, ip, m_web, argument0, tll);
                break;
            }
        }
    }
    else {
        var ip;
        for (var i = 1; i < ds_list_size(conectados); i++) {
            ip = ds_list_find_value(conectados, i);
            if ip != "" and ip != argument1 {
                network_enviados++;
                network_env_bytes += tll + m_head_udp;
                network_send_udp_raw(conexion, ip, m_web, argument0, tll);
            }
        }
    }
    buffer_delete(argument0);
}

