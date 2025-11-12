if !m_editor {
    if random(1) < 0.03 {
        var f = date_inc_hour(date_current_datetime(), -5);
        hora = date_get_hour(f);
        minuto = date_get_minute(f);
        dia = date_get_day(f);
        switch date_get_weekday(f) {
            case 0: semana = "Domingo"; break;
            case 1: semana = "Lunes"; break;
            case 2: semana = "Martes"; break;
            case 3: semana = "Miércoles"; break;
            case 4: semana = "Jueves"; break;
            case 5: semana = "Viernes"; break;
            case 6: semana = "Sábado"; break;
        }
    }
}


