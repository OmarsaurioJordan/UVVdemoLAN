if activo {
    altura -= 60 * dlt;
    if altura <= -100 {
        activo = false;
    }
}
reloj_fin -= dlt;
if reloj_fin <= 0 {
    instance_destroy();
}


