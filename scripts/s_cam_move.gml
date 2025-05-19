// arg0: posicion x mouse
// arg1: posicion y mouse
// arg2: id instancia que tiene las variables clicdx y clicdy

if argument2.clicdx != 0 and argument2.clicdy != 0 {
    view_xview[0] += argument2.clicdx - argument0;
    view_yview[0] += argument2.clicdy - argument1;
    view_xview[0] = clamp(view_xview[0], 0, room_width - view_wview[0]);
    view_yview[0] = clamp(view_yview[0], 0, room_height - view_hview[0]);
}
if mouse_check_button_pressed(mb_right) {
    argument2.clicdx = argument0; argument2.clicdy = argument1; }
else if mouse_check_button_released(mb_right) {
    argument2.clicdx = 0; argument2.clicdy = 0; }
view_xview[0] = round(view_xview[0]);
view_yview[0] = round(view_yview[0]);

