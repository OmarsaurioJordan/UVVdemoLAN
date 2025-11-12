if esconfeti {
    altu += 60 * dlt;
    if altu > o_control.globo_altura * 0.75 {
        var aux;
        var dd = random(360);
        for (var i = 0; i < 360; i += 15) {
            aux = instance_create(x, y, o_confeti);
            aux.direction = i + dd;
        }
        var asd = audio_play_sound_at(a_rocket_bum, x, y, o_control.globo_altura * 0.75,
            48, __view_get( e__VW.WView, 0 ) * 0.9, 1, false, 19);
        audio_sound_gain(asd, 0.9, 0);
        instance_destroy();
    }
}
else {
    altu += 10 * dlt;
    if altu > o_control.globo_altura {
        instance_destroy();
    }
}


