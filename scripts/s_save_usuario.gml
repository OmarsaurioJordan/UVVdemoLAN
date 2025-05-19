// arg0: id de instancia usuario

with argument0 {
    ini_open("usuario" + string(idweb) + ".ini");
    if propietario {
        ini_write_string("header", "propietario", "1");
    }
    else {
        ini_write_string("header", "propietario", "0");
    }
    ini_write_string("header", "idweb", string(idweb)); // inutil
    ini_write_string("perfil", "nombre", nombre);
    ini_write_string("perfil", "registro", string(registro));
    ini_write_string("perfil", "actividadweb", string(actividadweb));
    ini_write_string("perfil", "fecha", string(fecha));
    ini_write_string("perfil", "zodiaco", string(zodiaco));
    ini_write_string("perfil", "edad", string(edad));
    ini_write_string("perfil", "genero", string(genero));
    ini_write_string("perfil", "nivel", string(nivel));
    ini_write_string("perfil", "grupo", string(grupo));
    ini_write_string("perfil", "descripcion", descripcion);
    ini_write_string("perfil", "biografia", biografia);
    ini_write_string("perfil", "contacto", contacto);
    ini_write_string("perfil", "hashtag", hashtag);
    ini_write_string("perfil", "piel", string(piel));
    ini_write_string("avatar", "emocion", string(emocion));
    ini_write_string("avatar", "panfleto", panfleto);
    ini_write_string("avatar", "dia_panfleto", string(dia_panfleto));
    ini_write_string("avatar", "ropa", string(ropa));
    ini_write_string("avatar", "tela", string(tela));
    ini_write_string("avatar", "pelo", string(pelo));
    ini_write_string("avatar", "tinte", string(tinte));
    ini_write_string("avatar", "objeto", string(objeto));
    ini_write_string("avatar", "posx", string(posx));
    ini_write_string("avatar", "posy", string(posy));
    for (var c = 0; c < o_control.total_contactos; c++) {
        ini_write_string("amigo", "c" + string(c), string(amigo[c]));
        ini_write_string("amigo", "t" + string(c), string(amigi[c]));
    }
    for (var b = 0; b < o_control.total_bloqueados; b++) {
        ini_write_string("enemigo", "b" + string(b), string(enemigo[b]));
    }
    ini_close();
    s_ini_md5_close("usuario" + string(idweb) + ".ini");
}

