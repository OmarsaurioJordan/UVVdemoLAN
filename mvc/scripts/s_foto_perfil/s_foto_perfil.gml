// arg0: str nombre de archivo donde guardar
// arg1: id de instancia usuario

var srf = surface_create(96, 192);
surface_set_target(srf);
draw_clear_alpha(c_white, 0);
// dibujar al perfil
s_draw_perfil(argument1, 0, 0);
// fin dibujado
surface_reset_target();
surface_save(srf, argument0);
surface_free(srf);

