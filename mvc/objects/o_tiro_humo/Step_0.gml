direction += 50 * dlt;
if imagen == 27 {
    reloj_fin -= dlt * 0.5;
    altura += 8 * dlt;
}
else {
    reloj_fin -= dlt;
    altura += 15 * dlt;
}
if reloj_fin <= 0 {
    instance_destroy();
}


