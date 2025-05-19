// ret: devuelve las coordenadas [x,y] de respawn al azar

var pos;
pos[0] = room_width / 2;
pos[1] = room_height / 2;
if instance_exists(o_pnt_respawn) {
    var respawn = instance_find(o_pnt_respawn,
        irandom(instance_number(o_pnt_respawn) - 1));
    pos[0] = respawn.x;
    pos[1] = respawn.y;
}
pos[0] += random_range(-5, 5);
pos[1] += random_range(-5, 5);
return pos;

