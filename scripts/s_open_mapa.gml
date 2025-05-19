s_ini_md5_open("mapa.ini");
ini_open("mapa.ini");
var n, aux, xx, yy, tt;

n = 0;
while ini_key_exists("solido", "x" + string(n)) {
    xx = real(ini_read_string("solido", "x" + string(n), "0"));
    yy = real(ini_read_string("solido", "y" + string(n), "0"));
    aux = instance_create(xx, yy, o_solido);
    aux.imagen = real(ini_read_string("solido", "i" + string(n), "0"));
    aux.subimagen = real(ini_read_string("solido", "s" + string(n), "0"));
    n++;
}

n = 0;
while ini_key_exists("decorado", "x" + string(n)) {
    xx = real(ini_read_string("decorado", "x" + string(n), "0"));
    yy = real(ini_read_string("decorado", "y" + string(n), "0"));
    aux = instance_create(xx, yy, o_decorado);
    aux.imagen = real(ini_read_string("decorado", "i" + string(n), "0"));
    aux.subimagen = real(ini_read_string("decorado", "s" + string(n), "0"));
    n++;
}

n = 0;
while ini_key_exists("pared", "x" + string(n)) {
    xx = real(ini_read_string("pared", "x" + string(n), "0"));
    yy = real(ini_read_string("pared", "y" + string(n), "0"));
    aux = instance_create(xx, yy, o_pared);
    aux.colorsito = real(ini_read_string("pared", "c" + string(n), "-1"));
    n++;
}

n = 0;
while ini_key_exists("especial", "x" + string(n)) {
    xx = real(ini_read_string("especial", "x" + string(n), "0"));
    yy = real(ini_read_string("especial", "y" + string(n), "0"));
    tt = real(ini_read_string("especial", "t" + string(n), "0"));
    aux = instance_create(xx, yy, tt);
    n++;
}

n = 0;
while ini_key_exists("game", "x" + string(n)) {
    xx = real(ini_read_string("game", "x" + string(n), "0"));
    yy = real(ini_read_string("game", "y" + string(n), "0"));
    tt = real(ini_read_string("game", "t" + string(n), "0"));
    aux = instance_create(xx, yy, tt);
    n++;
}

n = 0;
while ini_key_exists("zona", "x" + string(n)) {
    xx = real(ini_read_string("zona", "x" + string(n), "0"));
    yy = real(ini_read_string("zona", "y" + string(n), "0"));
    aux = instance_create(xx, yy, o_zona);
    aux.titulo = ini_read_string("zona", "t" + string(n), "");
    n++;
}

n = 0;
while ini_key_exists("luz", "x" + string(n)) {
    xx = real(ini_read_string("luz", "x" + string(n), "0"));
    yy = real(ini_read_string("luz", "y" + string(n), "0"));
    instance_create(xx, yy, o_luz);
    n++;
}

if m_editor {
    n = 0;
    while ini_key_exists("punto", "x" + string(n)) {
        xx = real(ini_read_string("punto", "x" + string(n), "0"));
        yy = real(ini_read_string("punto", "y" + string(n), "0"));
        aux = instance_create(xx, yy, o_punto);
        aux.titulo = ini_read_string("punto", "t" + string(n), "");
        n++;
    }
}
else {
    n = 0;
    while ini_key_exists("punto", "x" + string(n)) {
        xx = real(ini_read_string("punto", "x" + string(n), "0"));
        yy = real(ini_read_string("punto", "y" + string(n), "0"));
        switch ini_read_string("punto", "t" + string(n), "") {
            case "plazoleta": instance_create(xx, yy, o_pnt_plazoleta); break;
            case "campo": instance_create(xx, yy, o_pnt_campo); break;
            case "reja": instance_create(xx, yy, o_pnt_reja); break;
            case "piscina": instance_create(xx, yy, o_pnt_piscina); break;
            case "futbol":
                instance_create(xx, yy, o_pnt_futbol);
                instance_create(xx, yy, o_pnt_normal);
                break;
            case "respawn": instance_create(xx, yy, o_pnt_respawn); break;
            case "techo": instance_create(xx, yy, o_pnt_techo); break;
            case "floral": instance_create(xx, yy, o_pnt_floral); break;
            case "lago1":
                instance_create(xx, yy, o_pnt_lago1);
                instance_create(xx, yy, o_pnt_floral);
                break;
            case "lago2":
                instance_create(xx, yy, o_pnt_lago2);
                instance_create(xx, yy, o_pnt_floral);
                break;
            case "normal":
                instance_create(xx, yy, o_pnt_normal);
                break;
        }
        n++;
    }
}

if m_editor {
    n = 0;
    while ini_key_exists("baldoza", "x" + string(n)) {
        xx = real(ini_read_string("baldoza", "x" + string(n), "0"));
        yy = real(ini_read_string("baldoza", "y" + string(n), "0"));
        aux = instance_create(xx, yy, o_baldoza);
        aux.subimagen = real(ini_read_string("baldoza", "s" + string(n), "0"));
        aux.colorsito = real(ini_read_string("baldoza", "c" + string(n), "0"));
        n++;
    }
}
else {
    with o_control {
        n = 0;
        baldozall = noone;
        while ini_key_exists("baldoza", "x" + string(n)) {
            baldozall[n, 0] = real(ini_read_string("baldoza", "x" + string(n), "0"));
            baldozall[n, 1] = real(ini_read_string("baldoza", "y" + string(n), "0"));
            baldozall[n, 2] = real(ini_read_string("baldoza", "s" + string(n), "0"));
            baldozall[n, 3] = real(ini_read_string("baldoza", "c" + string(n), "0"));
            n++;
        }
    }
}

ini_close();

