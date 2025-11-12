if activo {
    image_angle += 44 * dlt;
    if destino == noone {
        reloj_fin -= dlt;
        if reloj_fin <= 0 {
            activo = false;
            exit;
        }
    }
    else {
        if point_distance(x, y, destino.x - 30, destino.y) < 16 {
            activo = false;
            exit;
        }
        if random(1) < 0.03 {
            direction = point_direction(x, y, destino.x - 30, destino.y);
        }
    }
    var vv = 111 * dlt;
    x += lengthdir_x(vv, direction);
    y += lengthdir_y(vv, direction);
    depth = -y;
}


