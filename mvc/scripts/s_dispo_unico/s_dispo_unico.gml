// arg0: id dispo recien creada

var n = 0;
var ok = true;
while ok {
    ok = false;
    with o_dispo {
        if name == n {
            n++;
            ok = true;
            break;
        }
    }
}
argument0.name = n;

