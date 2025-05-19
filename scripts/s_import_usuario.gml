// arg0: str nombre de archivo, con extension y todo
// nota: pondra datos sobre usuario activo actual

var res;
with o_control.mipropio {
    ini_open(argument0);
    // perfil:
    res = string_replace(ini_read_string("perfil", "nombre", ""), "#", "");
    res = s_string_letters_digits(res);
    if res != "" {
        while string_width(res) * 0.8 > 72 {
            res = string_copy(res, 1, string_length(res) - 1);
        }
        nombre = res;
        nombremas = s_letters_digits_lower(nombre);
        registro = s_current_time();
        s_nombre_unico(id);
    }
    // basicos:
    res = real(ini_read_string("perfil", "zodiaco", "0"));
    zodiaco = clamp(round(res), 0, 11);
    res = real(ini_read_string("perfil", "edad", "0"));
    edad = clamp(round(res), 1900, current_year - 1);
    // 0:fem, 1:masc
    res = real(ini_read_string("perfil", "genero", "0"));
    genero = clamp(round(res), 0, 1);
    // 0:estudiante, 1:profesor, 2:doctor
    res = real(ini_read_string("perfil", "nivel", "0"));
    nivel = clamp(round(res), 0, array_length_1d(o_control.title) - 1);
    res = real(ini_read_string("perfil", "grupo", "0"));
    grupo = clamp(round(res), 0, array_length_1d(o_control.grupos) - 1);
    // texto largo
    res = ini_read_string("perfil", "descripcion", "");
    while string_height_ext(res, 13, 128) * 0.6 > 80 or
            string_width_ext(res, 13, 128) * 0.6 > 72 {
        res = string_copy(res, 1, string_length(res) - 1);
    }
    descripcion = res;
    res = ini_read_string("perfil", "biografia", "");
    while string_height_ext(res, 13, 232 * 1.5) * 0.6 > 172 * 1.5 or
            string_width_ext(res, 13, 232 * 1.5) * 0.6 > 150 * 1.5 {
        res = string_copy(res, 1, string_length(res) - 1);
    }
    biografia = res;
    // web
    res = ini_read_string("perfil", "contacto", "");
    contacto = string_copy(res, 1, min(string_length(res), 255));
    // texto para ubicar a otros usuarios iguales
    res = string_replace(ini_read_string("perfil", "hashtag", ""), "#", "");
    while string_width(res) * 0.7 > 72 {
        res = string_copy(res, 1, string_length(res) - 1);
    }
    hashtag = res;
    elhashtagmin = s_letters_digits_lower(hashtag);
    // 0:blanco, 1:mestizo, 2:negro
    res = real(ini_read_string("perfil", "piel", string(irandom(2))));
    piel = clamp(round(res), 0, 2);
    // avatar:
    res = real(ini_read_string("avatar", "emocion", "0"));
    emocion = clamp(round(res), 0, sprite_get_number(d_emocion) - 1);
    res = real(ini_read_string("avatar", "ropa", "0"));
    ropa = clamp(round(res), 0, sprite_get_number(d_ropa_fem) - 1);
    res = real(ini_read_string("avatar", "tela", "0"));
    tela = clamp(round(res), 0, array_length_1d(o_control.colores) - 1);
    res = real(ini_read_string("avatar", "pelo", "0"));
    pelo = clamp(round(res), 0, sprite_get_number(d_pelo) - 1);
    res = real(ini_read_string("avatar", "tinte", "0"));
    tinte = clamp(round(res), 0, array_length_1d(o_control.colores) - 1);
    res = real(ini_read_string("avatar", "objeto", "0"));
    objeto = clamp(round(res), 0, sprite_get_number(d_objeto) - 2);
    // contactos
    var nn;
    for (var c = 0; c < o_control.total_contactos; c++) {
        res = real(ini_read_string("amigo", "c" + string(c), "0"));
        amigo[c] = clamp(round(res), 1, 65535);
        res = real(ini_read_string("amigo", "t" + string(c), "0"));
        amigi[c] = clamp(round(res), 0, 3);
        nn = s_busca_pornombre(ini_read_string("amigo", "n" + string(c), "???"));
        if nn != -1 {
            amigo[c] = nn;
        }
    }
    // bloqueados
    for (var b = 0; b < o_control.total_bloqueados; b++) {
        res = real(ini_read_string("enemigo", "b" + string(b), "0"));
        enemigo[b] = clamp(round(res), 1, 65535);
        nn = s_busca_pornombre(ini_read_string("enemigo", "n" + string(b), "???"));
        if nn != -1 {
            enemigo[b] = nn;
        }
    }
    ini_close();
}

