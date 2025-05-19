// arg0: id buffer con datos, listo para leer, ojo: no eliminarlo ni seek

var idw = buffer_read(argument0, buffer_u16);
var ordn = buffer_read(argument0, buffer_u8);
var actw = buffer_read(argument0, buffer_u32);
var quien = noone;
with o_usuario {
    if idweb == idw {
        if propietario {
            exit;
        }
        if ordn > orden_udp or orden_udp - ordn > 127 {
            orden_udp = ordn;
        }
        else {
            exit;
        }
        quien = id;
        break;
    }
}
if quien == noone {
    if s_current_time() - actw > o_control.caducidad_usr {
        exit;
    }
    quien = s_open_usuario("usuario" + string(idw) + ".ini", false);
    if quien == noone {
        exit;
    }
}
with quien {
    var antn = nombre;
    nombre = buffer_read(argument0, buffer_string);
    if nombre != antn {
        nombremas = s_letters_digits_lower(nombre);
    }
    registro = buffer_read(argument0, buffer_u32);
    fecha = buffer_read(argument0, buffer_u32);
    zodiaco = buffer_read(argument0, buffer_u8);
    edad = buffer_read(argument0, buffer_u8) + 1900;
    genero = buffer_read(argument0, buffer_u8);
    nivel = buffer_read(argument0, buffer_u8);
    grupo = buffer_read(argument0, buffer_u8);
    descripcion = buffer_read(argument0, buffer_string);
    biografia = buffer_read(argument0, buffer_string);
    contacto = buffer_read(argument0, buffer_string);
    var anthas = hashtag;
    hashtag = buffer_read(argument0, buffer_string);
    if hashtag != anthas {
        elhashtagmin = s_letters_digits_lower(hashtag);
    }
    piel = buffer_read(argument0, buffer_u8);
    emocion = buffer_read(argument0, buffer_u8);
    panfleto = buffer_read(argument0, buffer_string);
    dia_panfleto = buffer_read(argument0, buffer_u32);
    ropa = buffer_read(argument0, buffer_u8);
    tela = buffer_read(argument0, buffer_u8);
    pelo = buffer_read(argument0, buffer_u8);
    tinte = buffer_read(argument0, buffer_u8);
    objeto = buffer_read(argument0, buffer_u16);
    posx = buffer_read(argument0, buffer_u16);
    posy = buffer_read(argument0, buffer_u16);
    expresion = buffer_read(argument0, buffer_u8);
    reloj_expresion = (buffer_read(argument0, buffer_u8) / 255) * o_control.expresion;
    dialogo = buffer_read(argument0, buffer_string);
    reloj_dialogo = (buffer_read(argument0, buffer_u8) / 255) * o_control.dialogo;
    for (var c = 0; c < o_control.total_contactos; c++) {
        amigo[c] = buffer_read(argument0, buffer_u16);
        amigi[c] = buffer_read(argument0, buffer_u8);
    }
    for (var b = 0; b < o_control.total_bloqueados; b++) {
        enemigo[b] = buffer_read(argument0, buffer_u16);
    }
    salud = buffer_read(argument0, buffer_u32);
    puntero_x = buffer_read(argument0, buffer_u16);
    puntero_y = buffer_read(argument0, buffer_u16);
    // actualizar contador delay desconexion
    var i = ds_list_find_index(o_control.idconectados, idweb);
    if i != -1 {
        ds_list_replace(o_control.tiempomuerto, i, o_control.udp_tiempomuerto);
    }
}

