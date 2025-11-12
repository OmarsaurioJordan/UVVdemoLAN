// arg0: id de lista que posee los datos
// arg1: str de nombre deseado para el archivo, con formato
// ret: true si pudo reconstruirlo

var res = false;
if ds_list_size(argument0) >= 4 {
    if string_count("1", ds_list_find_value(argument0, 2)) ==
            real(ds_list_find_value(argument0, 1)) {
        var txt = "";
        for (var i = 3; i < ds_list_size(argument0); i++) {
            txt += ds_list_find_value(argument0, i);
        }
        var buf = buffer_base64_decode(txt);
        var zfi = buffer_get_size(buf);
        buffer_seek(buf, buffer_seek_start, 0);
        if file_exists(argument1) {
            file_delete(argument1);
        }
        var bfi = file_bin_open(argument1, 1);
        repeat zfi {
            file_bin_write_byte(bfi, buffer_read(buf, buffer_u8));
        }
        file_bin_close(bfi);
        buffer_delete(buf);
        res = true;
    }
}
return res;

