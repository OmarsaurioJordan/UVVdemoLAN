// hace zoom con el mouse
var minw = room_width * 0.05;
var maxw = room_width;
var minh = room_height * 0.05;
var maxh = room_height;
var velcambio = 0.1;
// hacer las cosas
var rezi = 0;
if mouse_wheel_down() {
    rezi = 1 + velcambio;
}
if mouse_wheel_up() {
    rezi = 1 - velcambio;
}
if rezi != 0 {
    var mx = mouse_x;
    var my = mouse_y;
    var cx = (mx - __view_get( e__VW.XView, 0 )) / __view_get( e__VW.WView, 0 );
    var cy = (my - __view_get( e__VW.YView, 0 )) / __view_get( e__VW.HView, 0 );
    __view_set( e__VW.WView, 0, clamp(__view_get( e__VW.WView, 0 ) * rezi, minw, maxw) );
    __view_set( e__VW.HView, 0, clamp(__view_get( e__VW.HView, 0 ) * rezi, minh, maxh) );
    cx = mx - cx * __view_get( e__VW.WView, 0 );
    cy = my - cy * __view_get( e__VW.HView, 0 );
    __view_set( e__VW.XView, 0, clamp(cx, 0, room_width - __view_get( e__VW.WView, 0 )) );
    __view_set( e__VW.YView, 0, clamp(cy, 0, room_height - __view_get( e__VW.HView, 0 )) );
}
__view_set( e__VW.XView, 0, round(__view_get( e__VW.XView, 0 )) );
__view_set( e__VW.YView, 0, round(__view_get( e__VW.YView, 0 )) );
