// arg0: id de usuario que se convierte en buffer
// ret: id de buffer (no olvidar destruirlo luego)

with argument0 {
    var lll = string_length(dialogo + panfleto + hashtag + contacto + biografia +
        descripcion + nombre);
    var buf = s_header(1, 47 + lll + o_control.total_contactos * 3 +
        o_control.total_bloqueados * 2);
    buffer_write(buf, buffer_u16, idweb);
    orden_udp++;
    if orden_udp > 255 {
        orden_udp = 0;
    }
    buffer_write(buf, buffer_u8, orden_udp);
    buffer_write(buf, buffer_u32, actividadweb);
    // bloque de datos
    buffer_write(buf, buffer_string, nombre);
    buffer_write(buf, buffer_u32, registro);
    buffer_write(buf, buffer_u32, fecha);
    buffer_write(buf, buffer_u8, zodiaco);
    buffer_write(buf, buffer_u8, edad - 1900);
    buffer_write(buf, buffer_u8, genero);
    buffer_write(buf, buffer_u8, nivel);
    buffer_write(buf, buffer_u8, grupo);
    buffer_write(buf, buffer_string, descripcion);
    buffer_write(buf, buffer_string, biografia);
    buffer_write(buf, buffer_string, contacto);
    buffer_write(buf, buffer_string, hashtag);
    buffer_write(buf, buffer_u8, piel);
    buffer_write(buf, buffer_u8, emocion);
    buffer_write(buf, buffer_string, panfleto);
    buffer_write(buf, buffer_u32, dia_panfleto);
    buffer_write(buf, buffer_u8, ropa);
    buffer_write(buf, buffer_u8, tela);
    buffer_write(buf, buffer_u8, pelo);
    buffer_write(buf, buffer_u8, tinte);
    buffer_write(buf, buffer_u16, objeto);
    buffer_write(buf, buffer_u16, posx);
    buffer_write(buf, buffer_u16, posy);
    buffer_write(buf, buffer_u8, expresion);
    buffer_write(buf, buffer_u8, round((reloj_expresion / o_control.expresion) * 255));
    buffer_write(buf, buffer_string, dialogo);
    buffer_write(buf, buffer_u8, round((reloj_dialogo / o_control.dialogo) * 255));
    for (var c = 0; c < o_control.total_contactos; c++) {
        buffer_write(buf, buffer_u16, amigo[c]);
        buffer_write(buf, buffer_u8, amigi[c]);
    }
    for (var b = 0; b < o_control.total_bloqueados; b++) {
        buffer_write(buf, buffer_u16, enemigo[b]);
    }
    buffer_write(buf, buffer_u32, salud);
    buffer_write(buf, buffer_u16, puntero_x);
    buffer_write(buf, buffer_u16, puntero_y);
    return buf;
}

