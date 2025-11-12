switch vidas {
    case 0:
        draw_sprite(d_cosas_game, 5, x, y);
        break;
    case 1:
        draw_sprite(d_cosas_game, 4, x, y);
        draw_sprite(d_cosas_game, 2, x, y);
        draw_sprite(d_cosas_game, 1, x, y);
        draw_sprite(d_cosas_game, 3, x, y);
        break;
    case 2:
        draw_sprite(d_cosas_game, 2, x, y);
        draw_sprite(d_cosas_game, 1, x, y);
        draw_sprite(d_cosas_game, 3, x, y);
        break;
    case 3:
        draw_sprite(d_cosas_game, 2, x, y);
        draw_sprite(d_cosas_game, 1, x, y);
        break;
    case 4:
        draw_sprite(d_cosas_game, 1, x, y);
        break;
}

draw_sprite(d_game, imge, x, y);

switch vidas {
    case 0:
        draw_sprite(d_cosas_game, 6, x, y);
        break;
    case 6:
        break;
    default:
        draw_sprite(d_cosas_game, 0, x, y);
        break;
}

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_transformed_colour(x, y - 81, string_hash_to_newline(adivinada),
    0.7, 0.7, 0, c_black, c_black, c_black, c_black, 1);


