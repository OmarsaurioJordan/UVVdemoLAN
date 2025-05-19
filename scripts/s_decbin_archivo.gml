// arg0: str con el binario codificado
// arg1: str de nombre de archivo con extension

var buf = buffer_base64_decode(argument0);
var tot = buffer_get_size(buf);
buffer_seek(buf, buffer_seek_start, 0);
var bfi = file_bin_open(argument1, 1);
repeat tot {
    file_bin_write_byte(bfi, buffer_read(buf, buffer_u8));
}
file_bin_close(bfi);
buffer_delete(buf);

