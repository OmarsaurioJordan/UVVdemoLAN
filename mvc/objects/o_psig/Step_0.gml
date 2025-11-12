if activo {
    x += 100 * dlt;
    if x - orix > o_control.signal_dist {
        activo = false;
    }
}


