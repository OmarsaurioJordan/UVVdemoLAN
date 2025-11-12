reloj_fin -= dlt;
if reloj_fin <= 0 {
    instance_destroy();
    exit;
}
var vel = o_control.vel_bala * dlt; // velocidad
var num = ceil(vel / 8); // segun sprite coli
var paso = vel / num;
var otr;
for (var i = 0; i < num; i++) {
    x += lengthdir_x(paso, direction);
    y += lengthdir_y(paso, direction);
    // colision
    otr = instance_place(x, y, o_bloque);
    if otr != noone {
        if otr.object_index == o_solido {
            if otr.imagen == d_estructura {
                switch otr.subimagen {
                    case 1: case 2:
                    case 3: case 4:
                    case 5: case 6:
                        otr = noone;
                        break;
                }
            }
        }
        else if otr.object_index == o_monumento {
            otr = noone;
        }
    }
    if otr != noone {
        var au = audio_play_sound_at(a_bala_fin, x, y, 64, 48,
            __view_get( e__VW.WView, 0 ) * 0.8, 1, false, 2);
        audio_sound_gain(au, 0.95, 0);
        instance_destroy();
        exit;
    }
    else {
        otr = instance_place(x, y, o_movil);
        if otr != noone and otr != origen { // golpear
            if otr == o_control.mipropio {
                if otr.panfleto == "" {
                    switch grupo {
                        case 0: // rojo
                            switch otr.objeto {
                                case 131: case 132: case 133:
                                case 135: case 136: case 137:
                                    otr.objeto = 0;
                                    break;
                            }
                            break;
                        case 1: // azul
                            switch otr.objeto {
                                case 130: case 132: case 133:
                                case 134: case 136: case 137:
                                    otr.objeto = 0;
                                    break;
                            }
                            break;
                        case 2: case 3: // amarillo y verde
                            switch otr.objeto {
                                case 130: case 131: case 132: case 133:
                                case 134: case 135: case 136: case 137:
                                    otr.objeto = 0;
                                    break;
                            }
                            break;
                    }
                }
            }
            instance_destroy();
            exit;
        }
        else {
            otr = instance_place(x, y, o_bicho);
            if otr != noone {
                with otr {
                    instance_destroy();
                }
                instance_destroy();
                exit;
            }
        }
    }
}
depth = -y;


