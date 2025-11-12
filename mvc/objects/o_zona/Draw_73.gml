if m_editor {
    if string_length(titulo) != 3 {
        instance_destroy();
        exit;
    }
    if o_control.herramienta == "zona" {
        var ccc = c_white;
        switch string_char_at(titulo, 1) {
            case "a": ccc = c_blue; break;
            case "b": ccc = c_red; break;
            case "c": ccc = c_fuchsia; break;
            case "d": ccc = c_yellow; break;
            case "e": ccc = c_maroon; break;
            case "f": ccc = c_lime; break;
            case "g": ccc = c_green; break;
            case "h": ccc = c_lime; break;
            case "i": ccc = c_teal; break;
            case "j": ccc = c_navy; break;
            case "k": ccc = c_navy; break;
            case "l": ccc = c_olive; break;
            case "m": ccc = c_fuchsia; break;
            case "n": ccc = c_purple; break;
            case "o": ccc = c_yellow; break;
            case "p": ccc = c_maroon; break;
            case "q": ccc = c_teal; break;
            case "r": ccc = c_navy; break;
            case "s": ccc = c_blue; break;
            case "t": ccc = c_blue; break;
            case "u": ccc = c_green; break;
            case "v": ccc = c_gray; break;
            case "w": ccc = c_gray; break;
            case "x": ccc = c_dkgray; break;
            case "y": ccc = c_dkgray; break;
            case "z": ccc = c_dkgray; break;
        }
        draw_circle_colour(x, y, o_control.radio_zona, ccc, ccc, true);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text_transformed_colour(x, y, string_hash_to_newline(titulo),
            1, 1, 0, c_black, c_black, c_black, c_black, 1);
    }
}
else {
    visible = false;
}


