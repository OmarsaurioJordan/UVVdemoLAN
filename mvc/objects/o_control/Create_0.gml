/// @description INI
s_ventana();
randomize();
date_set_timezone(timezone_utc);
draw_set_font(d_letras);
audio_falloff_set_model(audio_falloff_linear_distance_clamped);
audio_channel_num(200);
audio_listener_orientation(0, 0, -1, 0, -1, 0);
instance_create(0, 0, o_mouse);
depth = 0;

// simulacion
globalvar dlt;
dlt = 0;
reloj_ahorcado_palabras = 3;
reloj_kriature = 2;
lista_borra_repetidos = ds_list_create(); // basura necesaria
reloj_exit = 0;

// constantes
caducidad_usr = 60 * 30; // segundos para que un usuario desaparezca por desconexion
actu_kreature = 1; // segundos para sincronizar criaturas
nav_celda = 32; // talla celdas de navegacion NPCs
kreaturas = ceil((sprite_get_number(d_kreature) / 4) * 1.5); // numero de mascotas NPCs
quieto_min = 30; // segundos quieto el NPC
quieto_max = 180;
velocidad = 90; // desplazamiento avatar
expresion = 2; // segundos
dialogo = 3; // segundos base
libelulas = 101; // numero de insectos decorativos
dialogo_w = 0.12; // bonus segundos por letra
vercorreo = 3; // segundos para no anular vista de correo
relojes_acelerados = 2; // divisor para tiempos de confesion, cultivo (no acelerar = 1, acel = 30)
relojini_parlante = 3; // tiempo muerto entre prender o apagar, evita cambios rapidos
ver_perfil = 72; // distancia a usuario para ver su perfil
dist_seghala = 24; // distancia para engancharse a usuario, halarlo o seguirlo
dura_difusion = 60 * 10; // segundos mantener mensaje de radios
trozos_file = 6; // limite talla archivos FTP, trozos x 64 KB
entrenotas = 0.15; // minimo tiempo para repetir notas en el piano
cerca_especial = 64; // distancia detectar objeto especial
num_diapositivas = 12; // maximas diapositivas que puede tener la presentacion
limite_correos = 300; // para 200 palabras c/u
radio_zona = 100; // para techos, puntos especiales y nombres de espacios
total_contactos = 10; // maximas fichas de contacto a tener
total_bloqueados = 40; // maximos usuarios bloqueados
confesion_futuro_min = 60 * 5; // segundos a futuro para mostrar confesion, azar min
confesion_futuro_max = 60 * 15; // segundos a futuro para mostrar confesion, azar max
ahorcado_palabras = ds_list_create();
ds_list_add(ahorcado_palabras, ""); // lista words
reloj_ahorcado_palabras_max = 60; // segundos cada cuanto buscar palabras en diccionarios
juegovida_celda = 16; // talla celda del juego
nivel_celda = 4; // talla celda del juego
signal_reloj = 0.05; // frecuencia creacion particulas generador ondas
signal_dist = 400; // distancia max alcanzada por particulas generador ondas
vel_chispa = 200; // vel de chispa electronica para circuitos
vel_bala = 404; // vel de proyectil disparo
cadencia_bala = 0.5; // cada cuanto se repiten disparos
recarga_bala = 3; // tiempo que tarda en rellenarse la municion
municion_bala = 9; // disparos seguidos maximos antes de recargar
oscuridad = 0.5; // de 0-1 que tan oscuro es el suelo a plena noche
poder_cultivar = 60; // segundos para poder poner otra semilla
celda_ajedrez = 24; // talla celda del juego
time_respawn = 30; // segundos para respawn
bicho_vision = 250; // bicho evolutivo radio de vision maxima
bicho_velocidad = 120; // bicho evolutivo velocidad maxima desplazamiento
bicho_cp = 0.015; // bicho evolutivo consumo de energia pasivo
bicho_ca = 0.00025; // bicho evolutivo consumo de energia activo
bicho_alimento = 10; // energia aportada por un elimaneto al bicho evolutivo
bicho_capacidad = 70; // cantidad de energia que guarda el bicho evolutivo maximamente
bicho_dormir = 10; // segundos maximos que el bicho eovlutivo permanece quieto
vel_alimento = 50; // velocidad criatura alimento del bicho
desvanecer_muertos = 8; // segundos desaparecer cosas
secuencia_minima = 3; // primer nivel para el juego de frecuencia
secuencia_velocidad = 0.5; // segundos que dura cada tramo de secuencia
tiro_parabolico = 3; // cada cuantos segundos puede disparar el parabolico
tiro_parabofuerza = 0.75; // conversion de fuerza del parabolico, si fuerza max 255
tiro_parabogravedad = 16; // aceleracion de la gravedad en el tiro
calculadora_puntos = 9; // puntos para ganar
calculadora_solo = 4; // segundos para jugar solo con la calculadora
muestra_memoria = 2; // segundos mostrar ficha a memorizar
virus_incubacion = 60 * 10; // segundos maximos de incubacion del virus
virus_enfermedad = 60 * 10; // segundos maximos de enfermedad del virus
virus_distancia = 169; // distancia para contagiarse
celda_lienzo = 6; // talla de una baldoza del lienzo
cantidad_opiniones = 10; // para objetos de efecto global como clima
duracion_opiniones = 60 * 20; // segundos duracion opiniones objetos de efecto global
preguntas_max = 20; // maximo de preguntas para examen
encuesta_max = 10; // numero maximo de preguntas encuesta
globo_altura = 250; // hasta donde llega el globo antes de desaparecer
reloj_pintura = 30; // duracion pintura
limite_ahorcado = 8; // maximas letras que puede tener una palabra ahorcado

// pequenno tutorial
tutorial = s_ini_open("tutorial", 2);

// grupos de usuarios
grupos[0] = "Ingeniería";
grupos[1] = "Ciencia";
grupos[2] = "Arte";
grupos[3] = "Medicina";
grupos[4] = "Humanid.";
grupos[5] = "Economía";
grupos[6] = "Deporte";
grupos[7] = "Magia";
grupos[8] = "Logística";
grupos[9] = "???";

// titulos de usuarios
title[0] = "Est. ";
title[1] = "Pro. ";
title[2] = "Mas. ";
title[3] = "Doc. ";
title[4] = "Tec. ";
title[5] = "Egr. ";
title[6] = "Obr. ";
title[7] = "Adm. ";
title[8] = "Vis. ";

// colores para pelo, ropa, etc
colores[0] = make_colour_rgb(242, 237, 49); // yellow
colores[1] = make_colour_rgb(242, 181, 53); // orange
colores[2] = make_colour_rgb(241, 83, 37); // red
colores[3] = make_colour_rgb(62, 230, 213); // aqua
colores[4] = make_colour_rgb(60, 89, 232); // blue
colores[5] = make_colour_rgb(151, 244, 47); // lime
colores[6] = make_colour_rgb(108, 194, 84); // green
colores[7] = make_colour_rgb(254, 213, 171); // skin
colores[8] = make_colour_rgb(240, 118, 250); // fuchsia
colores[9] = make_colour_rgb(177, 64, 238); // purple
colores[10] = make_colour_rgb(227, 157, 51); // caqui
colores[11] = make_colour_rgb(182, 129, 97); // brown
colores[12] = make_colour_rgb(131, 107, 71); // darkwood
colores[13] = make_colour_rgb(224, 224, 224); // white
colores[14] = make_colour_rgb(143, 143, 143); // gray
colores[15] = make_colour_rgb(68, 68, 68); // black

// para editor
// pared, arbol, decorado, baldoza, especial, zona, game, luz, punto
herramienta = "pared";
puntox = 0;
puntoy = 0;
clicdx = 0;
clicdy = 0;
seleccion = 0;
colorsito = 0;
titulo_zona = "";


///USRs

// abrir perfiles de usuario
s_open_respawn();
var fff = file_find_first("usuario*.ini", 0);
var garbas = ds_list_create();
while fff != "" {
    if s_open_usuario(fff, false) == noone {
        ds_list_add(garbas, fff);
    }
    fff = file_find_next();
}
file_find_close();
var grb = ds_list_size(garbas);
for (var i = 0; i < grb; i++) {
    file_delete(ds_list_find_value(garbas, i));
}
ds_list_destroy(garbas);
var eli = s_ini_open("eliminados", 0);
s_ini_save("eliminados", eli + grb);

// crear o encontrar al usuario principal de este juego
var ilegal = 0;
mipropio = noone;
with o_usuario {
    if propietario {
        o_control.mipropio = id;
        ilegal++;
    }
}
if mipropio == noone {
    mipropio = s_open_usuario("", true);
    ilegal++;
}

// evitar mas de un usuario controlado por el mismo juego
if ilegal != 1 {
    show_message("Intento ilegal de manejar más de un usuario o ninguno (" +
        string(ilegal) + ")");
    game_end();
    exit;
}


///LAN

globalvar g_network, g_lan_id;
g_network = s_ini_open("g_network", m_net_peer);

// estadisticas network
network_enviados = 0;
network_env_bytes = 0;
network_recibidos = 0;
network_rec_bytes = 0;
reloj_network_est = 0;
network_estadist = "";

// para actualizar widgets
esp_sinc = 3;
optimi_sinc = esp_sinc + random(1);

// para envio de contactos
esp_contactos = 6;
reloj_contactos = esp_contactos + random(1);

// para conectarse
mascara = s_ini_open("mascaraLAN", "192.168.1.");
esp_lan = 5;
reloj_busqueda_lan = esp_lan + random(1);
udp_tiempomuerto = 30; // segundos dar a usuario como desconectado

// buffer persistente para saludo general
influencia_peer = random(100);
llave_lan = irandom(65535);
saludo_buf = s_header(0, 8);
buffer_write(saludo_buf, buffer_u16, mipropio.idweb);
buffer_write(saludo_buf, buffer_u16, llave_lan);
buffer_write(saludo_buf, buffer_f32, influencia_peer);
saludo_size = buffer_get_size(saludo_buf);

// conexion LAN
conexion = network_create_socket_ext(network_socket_udp, m_web);
if conexion < 0 {
    show_message("Advertencia: puerto " + string(m_web) + " no disponible!!!");
    game_end();
    exit;
}

// modelo info conectados
conectados = ds_list_create(); // IPs
tiempomuerto = ds_list_create(); // delay desconexion
idconectados = ds_list_create(); // IDwebs
esserver = ds_list_create(); // para saber si es server, util desde cliente
prioridad = ds_priority_create(); // para ver que peer gana

// agregar al usuario actual y auto saludarse
ds_list_add(conectados, "127.0.0.1");
ds_list_add(tiempomuerto, udp_tiempomuerto);
ds_list_add(idconectados, mipropio.idweb);
ds_list_add(esserver, false); // no importa si es un server
ds_priority_add(prioridad, mipropio.idweb, influencia_peer);
network_send_udp_raw(conexion, "127.0.0.1", m_web, saludo_buf, saludo_size);

// comenzar a buscar red VLAN oficial
mascvlan = "";
intercalador = false; // intermitente para intercalar mascara vs mascvlan
if os_is_network_connected() {
    http_get("http://omwekiatl.xyz/UVV_LAN.php");
}


///MUNDO

// crear el mundo
baldozall = noone;
s_open_mapa();
instance_create(0, 0, o_virtual_correo);
instance_create(0, 0, o_virtual_molino);

// obtener foto del mapa
if !file_exists("mapa.png") {
    s_foto_mapa("mapa.png", 1024);
}
var spr = sprite_add("mapa.png", 0, false, false, 0, 0);
var srf = surface_create(71, 61);
surface_set_target(srf);
draw_sprite_ext(spr, 0, 0, 0,
    (71 + 1) / sprite_get_width(spr),
    (61 + 1) / sprite_get_height(spr),
    0, c_white, 1);
surface_reset_target();
dd_mapa = sprite_create_from_surface(srf, 0, 0, 71, 61, false, false, 0, 0);
sprite_delete(spr);
surface_free(srf);

// rejilla para navegacion
zona = noone;
if !m_editor {
    zona = s_crea_rejilla();
}

// criaturas
if !m_editor {
    var kuant = 0;
    var xx, yy, nea;
    var fff = file_find_first("kreature*.ini", 0);
    while fff != "" {
        fff = filename_name(fff);
        while true {
            xx = random(room_width);
            yy = random(room_height);
            nea = instance_nearest(xx, yy, o_pnt_futbol);
            if point_distance(xx, yy, nea.x, nea.y) < radio_zona {
                break;
            }
        }
        with instance_create(xx, yy, o_kreature) {
            idweb = real(string_replace(string_replace(fff, "kreature", ""), ".ini", ""));
        }
        kuant++;
        if kuant >= kreaturas {
            break;
        }
        fff = file_find_next();
    }
    file_find_close();
    var n = 1;
    repeat kreaturas - kuant {
        while true {
            xx = random(room_width);
            yy = random(room_height);
            nea = instance_nearest(xx, yy, o_pnt_futbol);
            if point_distance(xx, yy, nea.x, nea.y) < radio_zona {
                break;
            }
        }
        with instance_create(xx, yy, o_kreature) {
            idweb = n;
            n++;
        }
    }
}

// crear voladores decorativos
if !m_editor {
    var xx, yy, nat, ddd, aux;
    for (var i = 0; i < libelulas; i++) {
        do {
            xx = random(room_width);
            yy = random(room_height);
            ddd = point_direction(xx, yy, room_width / 2, room_height / 2);
            nat = instance_nearest(xx, yy, o_pnt_floral);
        }
        until point_distance(xx, yy, nat.x, nat.y) < radio_zona and
            !collision_line(xx, yy, xx + lengthdir_x(radio_zona, ddd),
            yy + lengthdir_y(radio_zona, ddd), o_bloque, true, false);
        aux = instance_create(xx, yy, o_libelula);
        aux.idloc = i;
    }
    instance_create(room_width / 2, room_height / 2, o_dron);
}

// eliminar cosas repetidas
var aux;
while !ds_list_empty(lista_borra_repetidos) {
    aux = ds_list_find_value(lista_borra_repetidos, 0);
    ds_list_delete(lista_borra_repetidos, 0);
    with aux {
        instance_destroy();
    }
}
ds_list_destroy(lista_borra_repetidos);

// dibujar los tiles de baldozas
if is_array(baldozall) {
    for (var i = 0; i < array_height_2d(baldozall); i++) {
        tile_add(dd_baldoza, baldozall[i, 2] * 64, baldozall[i, 3] * 64,
            64, 64, baldozall[i, 0] - 32, baldozall[i, 1] - 32, 1);
    }
}
with o_baldoza {
    instance_destroy();
}

// solo para pruebas, sobrepoblar con ficticios
//s_poblar(99);


