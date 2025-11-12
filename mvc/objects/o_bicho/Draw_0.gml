var ccc = merge_colour(merge_colour(c_lime, c_orange, gen[5]), c_white, 0.5);
var alt = 58 + anima[0];
// alas
if !activo {
    alt = 24;
    draw_sprite_ext(d_bicho, 17 + clamp(round(4 * gen[1] - 0.5), 0, 3),
        x, y - alt, 1, 1, -18, ccc, 1);
    draw_sprite_ext(d_bicho, 17 + clamp(round(4 * gen[1] - 0.5), 0, 3),
        x, y - alt, -1, 1, 18, ccc, 1);
}
else {
    draw_sprite_ext(d_bicho, 17 + clamp(round(4 * gen[1] - 0.5), 0, 3),
        x, y - alt, 1, 1, anima[1], ccc, 1);
    draw_sprite_ext(d_bicho, 17 + clamp(round(4 * gen[1] - 0.5), 0, 3),
        x, y - alt, -1, 1, -anima[1], ccc, 1);
}
// cuerpo
draw_sprite_ext(d_bicho, 1 + clamp(round(4 * gen[2] - 0.5), 0, 3),
    x, y - alt, 1, 1, 0, ccc, 1);
// orejas
draw_sprite_ext(d_bicho, 5 + clamp(round(4 * gen[3] - 0.5), 0, 3),
    x, y - alt, 1, 1, 0, ccc, 1);
// cabeza
draw_sprite_ext(d_bicho, 0, x, y - alt, 1, 1, 0, ccc, 1);
// pinzas
draw_sprite_ext(d_bicho, 9 + clamp(round(4 * gen[4] - 0.5), 0, 3),
    x, y - alt, 1, 1, 0, ccc, 1);
// ojos
draw_sprite_ext(d_bicho, 13 + clamp(round(4 * gen[0] - 0.5), 0, 3),
    x, y - alt, 1, 1, 0, ccc, 1);

//draw_healthbar(x - 20, y - 86, x + 20, y - 80, (energia / fenotipo[2]) * 100,
//    c_gray, c_red, c_lime, 0, true, true);


