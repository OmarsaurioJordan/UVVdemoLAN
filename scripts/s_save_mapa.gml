// arg0: str para extra nombre archivo, defecto vacio

if m_editor {
    var fff = "mapa" + argument0 + ".ini";
    if file_exists(fff) {
        file_delete(fff);
    }
    ini_open(fff);
    var n;
    
    with all {
        x = round(x);
        y = round(y);
    }
    
    n = 0;
    with o_solido {
        ini_write_string("solido", "x" + string(n), string(x));
        ini_write_string("solido", "y" + string(n), string(y));
        ini_write_string("solido", "i" + string(n), string(imagen));
        ini_write_string("solido", "s" + string(n), string(subimagen));
        n++;
    }
    
    n = 0;
    with o_decorado {
        ini_write_string("decorado", "x" + string(n), string(x));
        ini_write_string("decorado", "y" + string(n), string(y));
        ini_write_string("decorado", "i" + string(n), string(imagen));
        ini_write_string("decorado", "s" + string(n), string(subimagen));
        n++;
    }
    
    n = 0;
    with o_pared {
        ini_write_string("pared", "x" + string(n), string(x));
        ini_write_string("pared", "y" + string(n), string(y));
        ini_write_string("pared", "c" + string(n), string(colorsito));
        n++;
    }
    
    n = 0;
    with o_baldoza {
        ini_write_string("baldoza", "x" + string(n), string(x));
        ini_write_string("baldoza", "y" + string(n), string(y));
        ini_write_string("baldoza", "s" + string(n), string(subimagen));
        ini_write_string("baldoza", "c" + string(n), string(colorsito));
        n++;
    }
    
    n = 0;
    with o_especial {
        ini_write_string("especial", "x" + string(n), string(x));
        ini_write_string("especial", "y" + string(n), string(y));
        ini_write_string("especial", "t" + string(n), string(object_index));
        ini_write_string("especial", "n" + string(n), object_get_name(object_index));
        n++;
    }
    
    n = 0;
    with o_game {
        ini_write_string("game", "x" + string(n), string(x));
        ini_write_string("game", "y" + string(n), string(y));
        ini_write_string("game", "t" + string(n), string(object_index));
        ini_write_string("game", "n" + string(n), object_get_name(object_index));
        n++;
    }
    
    n = 0;
    with o_zona {
        ini_write_string("zona", "x" + string(n), string(x));
        ini_write_string("zona", "y" + string(n), string(y));
        ini_write_string("zona", "t" + string(n), titulo);
        n++;
    }
    
    n = 0;
    with o_punto {
        ini_write_string("punto", "x" + string(n), string(x));
        ini_write_string("punto", "y" + string(n), string(y));
        ini_write_string("punto", "t" + string(n), titulo);
        n++;
    }
    
    n = 0;
    with o_luz {
        ini_write_string("luz", "x" + string(n), string(x));
        ini_write_string("luz", "y" + string(n), string(y));
        n++;
    }
    
    ini_close();
    s_ini_md5_close(fff);
}

