/// @description s_ip_str_int(dato);
/// @param dato
// dato si string 0.0.0.0 lo pasa a int y vice versa

if is_string(argument0) {
    var ddd = s_split(argument0, ".", true);
    if is_array(ddd) {
        if array_length_1d(ddd) == 4 {
            return
                (real(ddd[0]) << 24) +
                (real(ddd[1]) << 16) +
                (real(ddd[2]) << 8) +
                real(ddd[3]);
        }
    }
    return 0;
}
else {
    return
        string((argument0 & 4278190080) >> 24) + "." +
        string((argument0 & 16711680) >> 16) + "." +
        string((argument0 & 65280) >> 8) + "." +
        string((argument0 & 255));
}

