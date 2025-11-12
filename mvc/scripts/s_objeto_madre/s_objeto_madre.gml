// arg0: ind de objeto
// ret: true si es un objeto que da otros objetos

switch argument0 {
    case 140: case 144: case 138: case 33:
    case 139: case 34: case 35: case 60:
    case 172: case 167: case 165:
        return true;
    default:
        return false;
}

