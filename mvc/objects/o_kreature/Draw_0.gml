var dsf = -4;
// pies
if reloj_pies == 0 {
    draw_sprite(d_kreature, 2 + tipok * 4, x, y);
    draw_sprite(d_kreature, 3 + tipok * 4, x, y);
}
else {
    var pai, pad;
    switch paso {
        case 1: pai = 0; pad = 6; break;
        case 2: pai = 2; pad = 4; break;
        case 3: pai = 4; pad = 2; break;
        case 4: pai = 6; pad = 0; break;
        case 5: pai = 4; pad = 2; break;
        case 0: pai = 2; pad = 4; break;
    }
    draw_sprite(d_kreature, 2 + tipok * 4, x, y - pai);
    draw_sprite(d_kreature, 3 + tipok * 4, x, y - pad);
}
// cuerpo
draw_sprite(d_kreature, 1 + tipok * 4, x, y + anima[0] + dsf);
// cabeza
draw_sprite(d_kreature, tipok * 4, x, y + anima[0] + anima[1] + dsf);
// objetos especiales
switch tipok {
    case 11:
        draw_sprite(d_objeto, 2, x, y + anima[0] + anima[2] + dsf);
        break;
    case 15:
        draw_sprite(d_objeto, 3, x, y + anima[0] + anima[2] + dsf);
        break;
}


