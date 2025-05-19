///s_udp_rebote(buffer, ip_excepcion);
// arg0: id de buffer, NO sera destruido
// arg1: string ip excepcion a envio, o ""

with o_control {
    buffer_seek(argument0, buffer_seek_start, 0);
    buffer_write(buf, buffer_u16, m_web);
    buffer_write(buf, buffer_u8, m_version);
    buffer_write(buf, buffer_u8, g_network);
    var tll = buffer_get_size(argument0);
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

