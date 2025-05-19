// arg0: str texto a buscar url
// ret: str url o vacio

var res = "";
var txt = string_replace(string_replace(argument0, "-#", ""), "#", " ");
while string_count("  ", txt) != 0 {
    txt = string_replace(txt, "  ", " ");
}
txt = s_split(txt, " ", true);
if is_array(txt) {
    for (var i = 0; i < array_length_1d(txt); i++) {
        if s_url(txt[i]) {
            res = txt[i];
            break;
        }
    }
}
return res;

