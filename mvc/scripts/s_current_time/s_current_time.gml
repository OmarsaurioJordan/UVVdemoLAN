// ret: segundos desde 1-ene-2020
// nota: ponga variables a 0 si quiere fecha vieja

return round(date_second_span(
    date_create_datetime(2020, 1, 1, 0, 0, 0),
    date_current_datetime()));

