// arg0: str vacio si nuevo, sino ini
// arg1: true si forzar a ser el usuario actual
// ret: id de usuario creado, o noone si fallo

var pos = s_pnt_respawn();
var xx = pos[0];
var yy = pos[1];
var res = instance_create(xx, yy, o_usuario);
with res {
    // valor unico al azar
    if argument0 == "" {
        idweb = irandom_range(1, 65535);
        s_ini_md5_open("usuario" + string(idweb) + ".ini");
        ini_open("usuario" + string(idweb) + ".ini");
    }
    else {
        idweb = real(string_replace(string_replace(argument0, ".ini", ""), "usuario", ""));
        s_ini_md5_open(argument0);
        ini_open(argument0);
    }
    // si es el usuario actual
    actividadweb = real(ini_read_string("perfil", "actividadweb", string(s_current_time())));
    if argument1 {
        propietario = true;
    }
    else {
        propietario = ini_read_string("header", "propietario", "0") != "0";
        if !propietario and s_current_time() - actividadweb > o_control.caducidad_usr {
            res = noone;
            ini_close();
            instance_destroy();
            break;
        }
    }
    // perfil:
    nombre = ini_read_string("perfil", "nombre", "usr" +
        string(irandom(9)) + string(irandom(9)) + string(irandom(9)));
    nombremas = s_letters_digits_lower(nombre);
    registro = real(ini_read_string("perfil", "registro", string(s_current_time())));
    // para calcular actualizacion reciente
    fecha = real(ini_read_string("perfil", "fecha", "0"));
    // basicos:
    zodiaco = real(ini_read_string("perfil", "zodiaco", string(irandom(11))));
    edad = real(ini_read_string("perfil", "edad", string(
        irandom_range(current_year - 15, current_year - 30))));
    // 0:fem, 1:masc
    genero = real(ini_read_string("perfil", "genero", string(irandom(1))));
    // 0:estudiante, 1:profesor, 2:doctor
    nivel = real(ini_read_string("perfil", "nivel", "0"));
    grupo = real(ini_read_string("perfil", "grupo",
        string(irandom(array_length_1d(o_control.grupos) - 1))));
    // texto largo
    descripcion = ini_read_string("perfil", "descripcion", "");
    biografia = ini_read_string("perfil", "biografia", "");
    // web
    contacto = ini_read_string("perfil", "contacto", "www.google.com");
    // texto para ubicar a otros usuarios iguales
    hashtag = ini_read_string("perfil", "hashtag", "");
    elhashtagmin = s_letters_digits_lower(hashtag);
    // 0:blanco, 1:mestizo, 2:negro
    piel = real(ini_read_string("perfil", "piel", string(irandom(2))));
    // avatar:
    emocion = real(ini_read_string("avatar", "emocion",
        string(irandom(sprite_get_number(d_emocion) - 1))));
    panfleto = ini_read_string("avatar", "panfleto", "");
    dia_panfleto = real(ini_read_string("avatar", "dia_panfleto", "0"));
    ropa = real(ini_read_string("avatar", "ropa",
        string(irandom_range(4, sprite_get_number(d_ropa_fem) - 1))));
    tela = real(ini_read_string("avatar", "tela",
        string(irandom(array_length_1d(o_control.colores) - 1))));
    pelo = real(ini_read_string("avatar", "pelo",
        string(irandom(sprite_get_number(d_pelo) - 1))));
    s_pelo_femenino(id, true);
    tinte = real(ini_read_string("avatar", "tinte",
        string(irandom(array_length_1d(o_control.colores) - 1))));
    objeto = real(ini_read_string("avatar", "objeto", "0"));
    posx = real(ini_read_string("avatar", "posx", string(xx)));
    posy = real(ini_read_string("avatar", "posy", string(yy)));
    // contactos
    for (var c = 0; c < o_control.total_contactos; c++) {
        amigo[c] = real(ini_read_string("amigo", "c" + string(c), "0"));
        amigi[c] = real(ini_read_string("amigo", "t" + string(c), "0"));
    }
    // bloqueados
    for (var b = 0; b < o_control.total_bloqueados; b++) {
        enemigo[b] = real(ini_read_string("enemigo", "b" + string(b), "0"));
    }
    ini_close();
    
    // ejecucion general
    expresion = 0;
    reloj_expresion = 0;
    dialogo = "";
    reloj_dialogo = 0;
    x = posx;
    y = posy;
    vida = m_vida; // para juego de disparos
    puntero_x = posx + random_range(-100, 100);
    puntero_y = posy + random_range(-100, 100);
    reloj_udp = 0; // para enviar actualizaciones
    expresion_ant = 0; // para ver si cambio expresion y sonar
    estaonline = true; // para ver si NPCs
    salud = 0; // 0:sano, 1:infectado, 2:enfermo, 3:muerto
    reloj_salud = 0; // para cambio de estado
    orden_udp = 0; // para evitar mensajes atrazados o duplicados
    parpadeo_llama = 0; // temporizador de parpadeo
    bloqueado = false; // ver si esta bloqueando o bloqueado por el actual
    
    // variables funcionamiento especifico
    s_var_usuario(id);
}
return res;

