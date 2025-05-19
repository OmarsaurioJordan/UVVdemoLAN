// arg0: id de instancia que llama
// ret: true si disparo la alarma

with argument0 {
    if reloj_sinc != -1 {
        reloj_sinc -= dlt;
        if reloj_sinc <= 0 {
            reloj_sinc = -1;
            return true;
        }
    }
}
return false;

