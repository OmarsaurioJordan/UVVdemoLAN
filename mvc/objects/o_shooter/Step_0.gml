/// @description  sincronia

if !m_editor {
    if visible and random(1) < 0.1 {
        for (var i = 0; i < 4; i++) {
            coloru[i] = 0;
        }
        var yop = id;
        with o_usuario {
            if panfleto == "" {
                switch objeto {
                    case 130: case 134: yop.coloru[0]++; break;
                    case 131: case 135: yop.coloru[1]++; break;
                    case 132: case 136: yop.coloru[2]++; break;
                    case 133: case 137: yop.coloru[3]++; break;
                }
            }
        }
    }
}


