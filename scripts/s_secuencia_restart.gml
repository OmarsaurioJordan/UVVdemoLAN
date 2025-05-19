// arg0: id de secuencia que llama
// arg1: true si hacer envio de udp

with argument0 {
    secuencia = "..x..";
    repeat o_control.secuencia_minima {
        secuencia += string(irandom(6)) + ".";
    }
    intento = "..x..";
    ultima = 0;
    repeticion = 4;
    reloj_secu = o_control.secuencia_velocidad;
    if argument1 {
        fecha = s_current_time();
        reloj_sinc = 0.5;
    }
    nota_anterior = "";
}

