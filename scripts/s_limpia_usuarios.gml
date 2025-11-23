with o_usuario {
    if file_exists("usuario" + string(idweb) + ".ini") {
        file_delete("usuario" + string(idweb) + ".ini");
    }
    instance_destroy();
}

