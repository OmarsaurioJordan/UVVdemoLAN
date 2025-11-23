with argument0 {
    if salud == 0 {
        salud = 1;
        reloj_salud = lerp(15, o_control.virus_incubacion, o_virus.incubacion / 9);
    }
}

