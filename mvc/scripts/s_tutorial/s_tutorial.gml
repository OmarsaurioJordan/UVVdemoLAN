/// @description s_tutorial(actual_ind);
/// @param actual_ind

if o_control.tutorial == argument0 {
    o_control.tutorial = argument0 - 1;
    s_ini_save("tutorial", argument0 - 1);
}

