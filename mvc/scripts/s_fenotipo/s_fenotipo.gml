// arg0: id bicho que convierte sus genes gen[] en fenotipo[] visible

with argument0 {
    // 0: radio vision
    // 1: velocidad andar
    // 2: capacidad energia
    // 3: empatia familiar
    // 4: agresividad no familiar
    // 5: temporizador dormir
    fenotipo[0] = lerp(0.2, 1, gen[0]) * o_control.bicho_vision;
    fenotipo[1] = lerp(0.2, 1, gen[1]) * o_control.bicho_velocidad;
    fenotipo[2] = lerp(0.4, 1, gen[2]) * o_control.bicho_capacidad;
    fenotipo[3] = lerp(-0.1, 0.5, gen[3]);
    fenotipo[4] = lerp(-0.1, 0.5, gen[4]);
    fenotipo[5] = lerp(0.1, 0.9, gen[5]) * o_control.bicho_dormir;
}

