// arg0: posicion x mouse
// arg1: posicion y mouse
// arg2: id instancia que tiene las variables clicdx y clicdy

if argument2.clicdx != 0 and argument2.clicdy != 0 {
    __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (argument2.clicdx - argument0) );
    __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (argument2.clicdy - argument1) );
    __view_set( e__VW.XView, 0, clamp(__view_get( e__VW.XView, 0 ), 0, room_width - __view_get( e__VW.WView, 0 )) );
    __view_set( e__VW.YView, 0, clamp(__view_get( e__VW.YView, 0 ), 0, room_height - __view_get( e__VW.HView, 0 )) );
}
if mouse_check_button_pressed(mb_right) {
    argument2.clicdx = argument0; argument2.clicdy = argument1; }
else if mouse_check_button_released(mb_right) {
    argument2.clicdx = 0; argument2.clicdy = 0; }
__view_set( e__VW.XView, 0, round(__view_get( e__VW.XView, 0 )) );
__view_set( e__VW.YView, 0, round(__view_get( e__VW.YView, 0 )) );

