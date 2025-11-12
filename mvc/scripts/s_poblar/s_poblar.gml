// arg0: numero de usuarios ficticios

if instance_number(o_usuario) == 1 {
    var aux;
    var ww = room_width;
    var hh = room_height;
    repeat argument0 {
        aux = s_open_usuario("", false);
        aux.posx = random_range(ww * 0.2, ww * 0.8);
        aux.posy = random_range(hh * 0.2, hh * 0.8);
    }
}

