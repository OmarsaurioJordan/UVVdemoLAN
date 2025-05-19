// arg0: id de parlante
// ret: true si esta completo el archivo

var res = false;
with argument0 {
    if !ds_list_empty(archivo) {
        if string_count("1", ds_list_find_value(archivo, 2)) ==
                real(ds_list_find_value(archivo, 1)) {
            res = true;
        }
    }
}
return res;

