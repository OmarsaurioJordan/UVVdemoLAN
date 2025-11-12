draw_sprite(d_game, imge, x, y);

var srf = surface_create(96, 96);
surface_set_target(srf);
draw_clear_alpha(c_white, 0);
var yop = id;
var list = ds_priority_create();
with o_usuario {
    if point_in_rectangle(x, y, yop.x - 96, yop.y - 96, yop.x + 96, yop.y - 0.1) {
        ds_priority_add(list, id, depth);
    }
}
var inte = intensidad * 5;
var xx = x - 48;
var yy = y - 96;
var enf = false;
while !ds_priority_empty(list) {
    with ds_priority_delete_max(list) {
        if salud != 0 {
            enf = true;
        }
        // dibujar tripas
        var dsf = -4;
        if genero != 0 {
            dsf -= 4;
        }
        // pies
        if reloj_pies == 0 {
            draw_sprite(d_tripas, 3 + inte, x - xx, y - yy);
            draw_sprite(d_tripas, 4 + inte, x - xx, y - yy);
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
            draw_sprite(d_tripas, 3 + inte, x - xx, y - pai - yy);
            draw_sprite(d_tripas, 4 + inte, x - xx, y - pad - yy);
        }
        // cuerpo
        draw_sprite(d_tripas, 1 + genero + inte, x - xx, y + anima[0] + dsf - yy);
        // cabeza
        draw_sprite(d_tripas, inte, x - xx, y + anima[0] + anima[1] + dsf - yy);
    }
}
ds_priority_destroy(list);
draw_set_blend_mode(bm_subtract);
draw_sprite(d_cosas_game, 33, 48, 96);
draw_set_blend_mode(bm_normal);
surface_reset_target();
if enf {
    draw_sprite(d_cosas_game, 34, x, y);
}
draw_surface(srf, x - 48, y - 96);
surface_free(srf);


