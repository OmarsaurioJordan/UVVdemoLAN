var ccc = c_lime;
var alt = 58 + anima[0];
// alas
draw_sprite_ext(d_bicho, 22,
    x, y - alt, 1, 1, anima[1], ccc, 1);
draw_sprite_ext(d_bicho, 22,
    x, y - alt, -1, 1, -anima[1], ccc, 1);
// cuerpo
draw_sprite_ext(d_bicho, 21,
    x, y - alt, 1, 1, 0, ccc, 1);


