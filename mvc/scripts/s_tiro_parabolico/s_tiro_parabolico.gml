// arg0: id de objeto parabolico
// arg1: angulo de tiro
// arg2: direccion de tiro
// arg3: fuerza de tiro
// arg4: true si enviar por udp

with argument0 {
    if reloj_tiro == 0 {
        reloj_tiro = o_control.tiro_parabolico;
        var aux = instance_create(x, y, o_tiro_pesado);
        aux.origen = id;
        aux.direction = argument2;
        var rad = degtorad(argument1);
        var fue = lerp(25, 255, argument3 / 255);
        aux.velx = o_control.tiro_parabofuerza * fue * cos(rad);
        aux.vely = o_control.tiro_parabofuerza * fue * sin(rad);
        if argument4 {
            var buf = s_header(38, 6);
            buffer_write(buf, buffer_u16, idweb);
            buffer_write(buf, buffer_u8, argument1);
            buffer_write(buf, buffer_u16, argument2);
            buffer_write(buf, buffer_u8, argument3);
            s_udp_send(buf, "");
        }
    }
}

