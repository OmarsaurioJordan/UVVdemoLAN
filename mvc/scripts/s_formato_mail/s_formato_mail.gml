// arg0: ind de mensaje a armar, debe existir en el mail
// ret: str con el mensaje

var res = "";
with o_virtual_correo {
    var quien = ds_list_find_value(emisores, argument0);
    with o_usuario {
        if idweb == quien {
            if bloqueado {
                return "***Remitente bloqueado***";
            }
            break;
        }
    }
    res = "De: " + s_busca_nombre(quien);
    res += "##Para: " + s_busca_nombre(ds_list_find_value(receptores, argument0));
    res += "##" + ds_list_find_value(mensajes, argument0);
    var dias = (s_current_time() - ds_list_find_value(fechas, argument0)) / 86400;
    res += "##(hace " + string(dias) + " días)";
}
return res;

