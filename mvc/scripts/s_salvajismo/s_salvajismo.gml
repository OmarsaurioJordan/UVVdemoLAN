// arg0: id criatura
// ret: 0:salvaje, 1:domestico, 2:humanoide

switch argument0.tipok {
    case 0: // uv
    case 1: // perro
    case 2: // gato
    case 13: // magico
    case 6: // gigante
    case 8: // enano
    case 5: // robot
        return 1;
    case 3: // toro
    case 9: // reptil
    case 14: // ninfa
    case 7: // fantasma
    case 4: // esqueleto
        return 0;
    case 10: // bot
    case 11: // guardia
    case 12: // obrero
    case 15: // smad
        return 2;
    default:
        return 1;
}

