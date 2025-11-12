var vel = velx * dlt; // velocidad
var num = max(1, ceil(vel / 12)); // segun sprite coli
var paso = vel / num;
vely -= o_control.tiro_parabogravedad * dlt;
var pasalt = (vely * dlt) / num;
var otr;
for (var i = 0; i < num; i++) {
    x += lengthdir_x(paso, direction);
    y += lengthdir_y(paso, direction);
    altura += pasalt;
    if altura <= 0 {
        instance_destroy();
        exit;
    }
    // colision
    if altura >= 82 {
        continue;
    }
    otr = instance_place(x, y, o_bloque);
    if otr != noone {
        if otr.object_index == o_solido {
            if otr.imagen == d_estructura {
                switch otr.subimagen {
                    case 1: case 2: // puerta
                        if altura < 50 {
                            otr = noone;
                        }
                        break;
                    case 3: case 4: // ventana
                        if altura > 40 and altura < 50 {
                            otr = noone;
                        }
                        break;
                    case 5: case 6: // muro
                        if altura > 40 {
                            otr = noone;
                        }
                        break;
                }
            }
        }
        else if otr.object_index == o_monumento {
            if altura > 30 {
                otr = noone;
            }
        }
    }
    if otr != noone and otr != origen {
        instance_destroy();
        exit;
    }
}
depth = -y;


