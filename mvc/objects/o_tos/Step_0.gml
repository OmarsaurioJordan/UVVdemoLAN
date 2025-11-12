direction += 50 * dlt;
altura = max(0, altura - 60 * dlt);
reloj_fin -= dlt;
if reloj_fin <= 0 {
    instance_destroy();
}


