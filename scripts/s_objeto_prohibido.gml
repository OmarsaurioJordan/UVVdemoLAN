// arg0: id instancia o_unidad
// arg1: true si subir

with argument0 {
    while true {
        switch objeto {
            case 4: case 15: case 16: case 17: case 18:
            case 19: case 20: case 31: case 36: case 69:
            case 70: case 71: case 72: case 77: case 81:
            case 82: case 99: case 100: case 101: case 125:
            case 130: case 131: case 132: case 133: case 134:
            case 135: case 136: case 137: case 146: case 151:
            case 152: case 153: case 154: case 155: case 157:
            case 158: case 159: case 160: case 161: case 162:
            case 169: case 168:
                break;
            default:
                exit;
        }
        if argument1 {
            objeto++;
            if objeto >= sprite_get_number(d_objeto) {
                objeto = 0;
            }
        }
        else {
            objeto--;
            if objeto < 0 {
                objeto = sprite_get_number(d_objeto) - 1;
            }
        }
    }
}

