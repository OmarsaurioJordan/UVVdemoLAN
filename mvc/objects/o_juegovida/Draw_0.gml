draw_sprite(d_game, imge, x, y);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_transformed_colour(x + 20, y - 40,
    string_hash_to_newline(string(round(ds_grid_get_sum(est_nex, 0, 0,
    ds_grid_width(est_nex) - 1, ds_grid_height(est_nex) - 1)))),
    0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);


