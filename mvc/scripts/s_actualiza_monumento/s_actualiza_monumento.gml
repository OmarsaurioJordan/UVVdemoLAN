// arg0: id de objeto monumento

with argument0 {
    if spritefull != noone {
        sprite_delete(spritefull);
        spritefull = noone;
    }
    if imagenpng != "" {
        s_decbin_archivo(imagenpng, "tmp.png");
        spritefull = sprite_add("tmp.png", 0, false, false, 48, 144);
        file_delete("tmp.png");
    }
}

