/// @description  sincronia

if !m_editor {
    if visible or random(1) < 0.003 {
        cercano = instance_nearest(x, y, o_usuario);
        if cercano.objeto != 0 or point_distance(x, y, cercano.x, cercano.y) > 50 {
            cercano = noone;
        }
    }
}


