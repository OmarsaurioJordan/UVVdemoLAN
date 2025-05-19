// arg0: str direccion web
// ret: true si es valida

return string_length(argument0) > 7 and
    (string_copy(argument0, 1, 7) == "http://" or
    string_copy(argument0, 1, 8) == "https://");

