image_angle += 50 * dlt;
var vv = velocy * dlt;
x += lengthdir_x(vv, direction);
y += lengthdir_y(vv, direction);
depth = -y;
altura -= 20 * dlt;
if altura <= 0 {
    instance_destroy();
}


