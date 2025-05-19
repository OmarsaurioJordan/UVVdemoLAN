// arg0: id de lista existente donde guardarlo
// arg1: str nombre de archivo existente de cualquier formato
// arg2: str nombre del archivo como sera guardado (titulo)
// ret: true si lo logro, falso si el archivo es muy grande

// formato de archivo en lista, todo en str:
// - titulo
// - numero de trozos totales
// - 00110101 orden de trozos listos
// - trozo 1
// - trozo 2
// - ...
// - trozo N

var res = true;
ds_list_clear(argument0);
var bfi = file_bin_open(argument1, 0);
var zfi = file_bin_size(bfi);
if zfi > o_control.trozos_file * 64000 {
    res = false;
}
else {
    ds_list_add(argument0, argument2);
    var tot = ceil(zfi / 64000);
    ds_list_add(argument0, string(tot));
    ds_list_add(argument0, string_repeat("1", tot));
    var buf = buffer_create(zfi, buffer_grow, 1);
    buffer_seek(buf, buffer_seek_start, 0);
    for (var b = 0; b < zfi; b++) {
        buffer_write(buf, buffer_u8, file_bin_read_byte(bfi));
    }
    var txt = buffer_base64_encode(buf, 0, zfi);
    buffer_delete(buf);
    var len;
    while txt != "" {
        len = string_length(txt);
        ds_list_add(argument0, string_copy(txt, 1, min(64000, len)));
        if len <= 64000 {
            txt = "";
        }
        else {
            txt = string_copy(txt, 64001, len - 64000);
        }
    }
}
file_bin_close(bfi);
return res;

