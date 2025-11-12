// arg0: str nombre de archivo existente de cualquier formato
// ret: str con el binario codificado

var bfi = file_bin_open(argument0, 0);
var zfi = file_bin_size(bfi);
var buf = buffer_create(zfi, buffer_grow, 1);
buffer_seek(buf, buffer_seek_start, 0);
for (var b = 0; b < zfi; b++) {
    buffer_write(buf, buffer_u8, file_bin_read_byte(bfi));
}
file_bin_close(bfi);
var res = buffer_base64_encode(buf, 0, buffer_get_size(buf));
buffer_delete(buf);
return res;

