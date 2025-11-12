/// @description  sincronia

if !m_editor {
    if s_ciclo_actualizador(id) {
        var buf = s_header(44, 11);
        buffer_write(buf, buffer_u16, idweb);
        buffer_write(buf, buffer_u32, fecha);
        buffer_write(buf, buffer_u8, mortandad);
        buffer_write(buf, buffer_u8, incubacion);
        buffer_write(buf, buffer_u8, enfermedad);
        buffer_write(buf, buffer_u8, transmision);
        buffer_write(buf, buffer_u8, curatodos);
        s_udp_send(buf, "");
    }
    
    if visible and random(1) < 0.03 {
        infectados = 0;
        muertos = 0;
        poblacion = 0;
        var yop = id;
        with o_usuario {
            yop.poblacion++;
            if salud == 1 {
                yop.muertos++;
            }
            else if salud != 0 {
                yop.infectados++;
            }
        }
        if poblacion != 0 {
            infectados = ceil((infectados / poblacion) * 100);
            muertos = ceil((muertos / poblacion) * 100);
        }
    }
}


