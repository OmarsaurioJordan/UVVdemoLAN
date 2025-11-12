idweb = irandom_range(1, 65535);
fecha = irandom(100);
reloj_sinc = -1;
fechamove = irandom(100);

tipok = irandom_range(1, sprite_get_number(d_kreature) / 4 - 1);
posx = x; // lugar actual fisico, mientras x,y dibujado
posy = y;
metax = x; // lugar a donde ir
metay = y;
// relojes para esperar o re calcular rutas (fechas futuras)
reloj_quiet = s_current_time();
reloj_move = reloj_quiet + 1;

viemetx = x; // metas viejas, para recalcular ruta
viemety = y;

// rejilla de navegacion
var cel = o_control.nav_celda;
var wmax = ceil(room_width / cel);
var hmax = ceil(room_height / cel);
rumbo = ds_grid_create(wmax, hmax);

// animacion
s_anima_ini(id, 3, true, false);

// evitar fallos
estaonline = false;
reloj_udp = 0;

alarm[0] = 1;
alarm[1] = room_speed * 30;


