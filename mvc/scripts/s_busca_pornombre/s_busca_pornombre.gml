// arg0: str nombre de usuario
// ret: id web del usuario o -1

var res = -1;
var nnn = s_letters_digits_lower(argument0);
with o_usuario {
    if s_letters_digits_lower(nombre) == nnn {
        res = idweb;
        break;
    }
}
return res;

