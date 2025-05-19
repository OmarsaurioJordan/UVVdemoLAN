// arg0: posicion x
// arg1: posicion y
// ret: idweb loco

var xx = round((x / room_width) * 255);
var yy = round((y / room_height) * 255);
return (xx << 8) + yy;

