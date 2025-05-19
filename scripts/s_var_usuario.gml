// arg0: id o_usuario que llama, variables de ejecucion

with argument0 {
    s_anima_ini(id, 4, true, false);
    if propietario {
        dial_usr_web = -1; // para ir a web de usuario
        dial_panfleto = -1; // para mensaje emergente del panfleto
        dial_registro = -1; // para mensaje emergente de registro
        tipo_registro = -1; // segun lo que se este pidiendo en registro
        dial_especial = -1; // para mensaje emergente de especiales
        andar_mouse = false; // seguir al puntero, modo manejo
        en_mira = noone; // perfil que se esta viendo
        tipo_especial = noone; // instancia especial al pedir mensaje emergente
        cerca_esp = noone; // instancia especial cercana
        comandos_gui = ""; // ayuda contextual GUI
        modo_chat = false; // si esta escribiendo mensaje rapido
        papelote = ""; // muestra un texto grande en pantalla
        mous_viejx = 0; // posiciones previas de mouse, para tablero
        mous_viejy = 0;
        reloj_vercorreo = 0; // tiempo para no perder mensaje si se mueve
        ver_mapa = noone; // sprite volatil de mapa
        seguir_halar = noone; // id de otro usuario
        reloj_cadencia = 0; // para disparos
        reloj_recarga = 0;
        municion = o_control.municion_bala;
        reloj_respawn = 0; // 0:desactivado
        data_bicho = ""; // datos de bicho evolutivo capturado
        reloj_conteo = -1; // para objeto temporizador
        numero_conteo = 0;
        reloj_obra_pintura = -1; // para enviar pintura
        pantalla = noone; // el objeto que sera ampliado
    }
    else {
        pos_viejx = x; // para ver si ha cambiado de posicion
        pos_viejy = y;
    }
}

