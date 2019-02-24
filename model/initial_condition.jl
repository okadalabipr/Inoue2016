function initial_values()
    u0 = zeros(length(F_V))

    u0[B] = 1.0; # B
    u0[M] = 1.0; # M
    u0[C] = 1.0; # C
    u0[TAK1] = 1.0; # TAK1
    u0[IKK] = 1.0; # IKK
    u0[NFKBc] = 1.0; # NFKBc

    return u0
end