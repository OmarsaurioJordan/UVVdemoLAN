// arg0: id o_parlante a ser silencio
// arg1: true si destruir archivo
// ret: true si lo elimino

var res = false;
with argument0 {
    if stream_play != noone {
        audio_stop_sound(stream_play);
        stream_play = noone;
    }
    if stream != noone {
        audio_destroy_stream(stream);
        stream = noone;
    }
    if argument1 {
        if file_exists("ogg/parlante" + string(idweb) + ".ogg") {
            file_delete("ogg/parlante" + string(idweb) + ".ogg");
        }
        if !ds_list_empty(archivo) {
            ds_list_clear(archivo);
            res = true;
        }
    }
}
return res;

