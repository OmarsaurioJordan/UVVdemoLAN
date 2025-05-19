///s_str_filtro(str, mascara, limite);
// limite: -1 es sin limite

var res = "";
var ch;
for (var c = 1; c <= string_length(argument0); c++) {
    ch = string_copy(argument0, c, 1);
    if string_count(ch, argument1) != 0 {
        res += ch;
    }
}
if argument2 > 0 {
    string_copy(res, 1, min(argument2, string_length(res)));
}
return res;

