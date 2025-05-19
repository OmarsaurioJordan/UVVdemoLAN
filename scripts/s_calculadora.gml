// arg0: id de objeto calculadora
// arg1: true si reiniciar, false cambiar nivel
// arg2: true si cambiar nivel afecta derecha, false izquierda
// arg3: 1 incrementar, -1 reducir, 0 no cambia

with argument0 {
    if argument1 { // reiniciar
        nivel = 0;
        puntos[0] = 0;
        puntos[1] = 0;
    }
    else { // cambiar
        var afe = 0;
        if argument2 {
            afe = 1;
        }
        puntos[afe] = clamp(puntos[afe] + argument3, 0, o_control.calculadora_puntos);
        if puntos[afe] == o_control.calculadora_puntos {
            if argument2 {
                pregunta = "--->";
            }
            else {
                pregunta = "<---";
            }
            respuesta[0] = "+";
            respuesta[1] = "-";
            respuesta[2] = "x";
            respuesta[3] = "/";
            exit;
        }
        if argument3 > 0 {
            nivel = min(nivel + 1, 255);
        }
    }
    // generar operacion
    verdadera = irandom(3);
    var a, b, c;
    var n2 = clamp(power(nivel, 2), 9, 99);
    var n1 = 1;
    if nivel > 5 {
        n1 = -n2;
    }
    switch choose(3, 2, 2, 1, 1, 1, 0, 0, 0) {
        case 0: // suma
            do {
                a = irandom_range(n1, n2);
                b = irandom_range(n1, n2);
                c = a + b;
                for (var i = 0; i < 4; i++) {
                    respuesta[i] = string(c + irandom_range(1, 11) * choose(-1, 1));
                }
            }
            until a != 0 and b != 0;
            pregunta = string(a) + " + " + string(b);
            respuesta[verdadera] = string(c);
            break;
        case 1: // resta
            do {
                a = irandom_range(n1, n2);
                b = irandom_range(n1, n2);
                c = a - b;
                for (var i = 0; i < 4; i++) {
                    respuesta[i] = string(c + irandom_range(1, 11) * choose(-1, 1));
                }
            }
            until a != 0 and b != 0;
            pregunta = string(a) + " - " + string(b);
            respuesta[verdadera] = string(c);
            break;
        case 2: // multiplicacion
            do {
                a = irandom_range(n1, n2);
                b = irandom_range(n1, n2);
                c = a * b;
                for (var i = 0; i < 4; i++) {
                    respuesta[i] = string(c + irandom_range(1, 11) * choose(-1, 1));
                }
            }
            until a != 0 and b != 0;
            pregunta = string(a) + " x " + string(b);
            respuesta[verdadera] = string(c);
            break;
        case 3: // division
            do {
                a = irandom_range(n1, n2);
                do {
                    b = irandom_range(n1, n2);
                }
                until b != 0;
                c = a / b;
                for (var i = 0; i < 4; i++) {
                    respuesta[i] = string(c + irandom_range(1, 11) * choose(-1, 1));
                }
            }
            until a != 0 and c == round(c);
            pregunta = string(a) + " / " + string(b);
            respuesta[verdadera] = string(c);
            break;
    }
}

