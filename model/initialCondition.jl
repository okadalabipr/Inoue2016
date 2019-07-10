function initialValues()
    u0 = zeros(V.len_f_vars);

    u0[V.B] = 1.0; # B
    u0[V.M] = 1.0; # M
    u0[V.C] = 1.0; # C
    u0[V.TAK1] = 1.0; # TAK1
    u0[V.IKK] = 1.0; # IKK
    u0[V.NFKBc] = 1.0; # NFKBc

    return u0
end