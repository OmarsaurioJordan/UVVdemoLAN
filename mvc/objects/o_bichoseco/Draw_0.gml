var a = reloj_fin / o_control.desvanecer_muertos;
var ccc = merge_colour(merge_colour(c_lime, c_orange, gen[5]), c_white, 0.5);
var alt = 24;
var xx = 25;
var yy = 24;
var srf = surface_create(48, 64);
surface_set_target(srf);
draw_clear_alpha(c_white, 0);
// alas
draw_sprite_ext(d_bicho, 17 + clamp(round(4 * gen[1] - 0.5), 0, 3),
    xx, yy, 1, 1, -18, ccc, 1);
draw_sprite_ext(d_bicho, 17 + clamp(round(4 * gen[1] - 0.5), 0, 3),
    xx, yy, -1, 1, 18, ccc, 1);
// cuerpo
draw_sprite_ext(d_bicho, 1 + clamp(round(4 * gen[2] - 0.5), 0, 3),
    xx, yy, 1, 1, 0, ccc, 1);
// orejas
draw_sprite_ext(d_bicho, 5 + clamp(round(4 * gen[3] - 0.5), 0, 3),
    xx, yy, 1, 1, 0, ccc, 1);
// cabeza
draw_sprite_ext(d_bicho, 0, xx, yy, 1, 1, 0, ccc, 1);
// pinzas
draw_sprite_ext(d_bicho, 9 + clamp(round(4 * gen[4] - 0.5), 0, 3),
    xx, yy, 1, 1, 0, ccc, 1);
// ojos
draw_sprite_ext(d_bicho, 13 + clamp(round(4 * gen[0] - 0.5), 0, 3),
    xx, yy, 1, 1, 0, ccc, 1);
surface_reset_target();
draw_surface_ext(srf, x - xx, y - yy - alt, 1, 1, 0, c_white, a);
surface_free(srf);


