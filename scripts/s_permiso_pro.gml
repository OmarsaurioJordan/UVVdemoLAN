// ret: true si debe ejecutar codigo global

if m_editor {
    return false;
}
if g_network == m_net_server {
    return true;
}
if g_network == m_net_peer {
    with o_control {
        return ds_priority_find_max(prioridad) == mipropio.idweb;
    }
}
return false;

