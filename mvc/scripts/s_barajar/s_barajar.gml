// arg0: id objeto tarot

with argument0 {
    var tot = sprite_get_number(d_tarot);
    carta[0] = irandom(tot - 1);
    do {
        carta[1] = irandom(tot - 1);
    }
    until carta[1] != carta[0];
    do {
        carta[2] = irandom(tot - 1);
    }
    until carta[2] != carta[0] and carta[2] != carta[1];
}

