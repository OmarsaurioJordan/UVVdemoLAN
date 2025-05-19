///s_str_es_ip(str);

var res = false;
var vec = s_split(argument0, ".", false);
var len;
if is_array(vec) {
    if array_length_1d(vec) == 4 {
        res = true;
        for (var i = 0; i < 4; i++) {
            vec[i] = s_str_filtro(vec[i], "1234567890", -1);
            len = string_length(vec[i]);
            if len == 0 or len > 3 {
                res = false;
                break;
            }
            else if real(vec[i]) > 255 {
                res = false;
                break;
            }
        }
    }
}
return res;

