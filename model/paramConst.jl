function f_params()
    p = zeros(C.len_f_params);

    p[C.kCp0] = 1.000000e-04;
    p[C.kCpB0] = 1.000000e-04;
    p[C.kCpM0] = 1.000000e-04;
    p[C.kCpBM0] = 1.000000e-04;
    p[C.kCpS] = 7.000000e+00;
    p[C.kCpBS] = 2.000000e+01;
    p[C.kCpMS] = 1.700000e+01;
    p[C.kCpBMS] = 1.000000e+00;
    p[C.kmCpS] = 1.000000e+00;
    p[C.kmCpBS] = 1.000000e+00;
    p[C.kmCpMS] = 1.000000e+00;
    p[C.kmCpBMS] = 5.000000e+00;
    p[C.kCpu] = 7.500000e-01;
    p[C.kCpBu] = 1.950000e+00;
    p[C.kCpMu] = 3.750000e+00;
    p[C.kCpBMu] = 2.500000e-01;
    p[C.kmCpu] = 1.000000e+00;
    p[C.kmCpBu] = 1.000000e+00;
    p[C.kmCpMu] = 1.000000e+00;
    p[C.kmCpBMu] = 2.500000e+00;

    p[C.kBaM] = 5.000000e-01;
    p[C.kCaB] = 5.000000e-01;
    p[C.kCaM] = 5.000000e-01;
    p[C.kCBaM] = 1.500000e+00;
    p[C.kCMaB] = 5.000000e-01;
    p[C.kCaBM] = 5.000000e-01;
    p[C.kCpaBM] = 1.885000e+00;
    p[C.kCpaB] = 7.885000e+00;
    p[C.kCpaM] = 4.585000e+00;
    p[C.kCpBaM] = 2.500000e+00;
    p[C.kCpMaB] = 1.500000e+00;
    p[C.kBdM] = 2.500000e+00;
    p[C.kCdB] = 1.000000e+00;
    p[C.kCdM] = 2.500000e+00;
    p[C.kCBdM] = 1.500000e+00;
    p[C.kCMdB] = 2.500000e+00;
    p[C.kCpdB] = 3.000000e-01;
    p[C.kCpdM] = 3.000000e-01;
    p[C.kCpBdM] = 1.500000e-01;
    p[C.kCpMdB] = 4.500000e-01;
    p[C.kCdBM] = 2.000000e-01;
    p[C.kCpdBM] = 2.500000e-01;

    p[C.kTp0] = 2.700000e-01;
    p[C.kCTpS] = 3.200000e-01;
    p[C.kCBTpS] = 1.320000e+00;
    p[C.kCMTpS] = 1.320000e+00;
    p[C.kCBMTpS] = 1.320000e+00;
    p[C.kmCTpS] = 2.100000e+00;
    p[C.kmCBTpS] = 2.100000e+00;
    p[C.kmCMTpS] = 2.100000e+00;
    p[C.kmCBMTpS] = 2.100000e+00;
    p[C.kTpIKK1] = 1.670000e+01;
    p[C.kmTpIKK1] = 7.800000e-01;
    p[C.kTpu] = 3.400000e+00;
    p[C.kmTpu] = 1.790000e+00;
    p[C.kTpC0] = 3.300000e-01;
    p[C.kCTpCS] = 5.500000e+00;
    p[C.kCBTpCS] = 1.750000e+01;
    p[C.kCMTpCS] = 1.650000e+01;
    p[C.kCBMTpCS] = 2.450000e+01;
    p[C.kmCTpCS] = 5.200000e-01;
    p[C.kmCBTpCS] = 5.200000e-01;
    p[C.kmCMTpCS] = 5.200000e-01;
    p[C.kmCBMTpCS] = 5.200000e-01;
    p[C.kTpCIKK1] = 1.000000e+01;
    p[C.kmTpCIKK1] = 7.800000e-01;
    p[C.kTpCIKK2] = 1.710000e+01;
    p[C.kmTpCIKK2] = 1.300000e-01;
    p[C.kTpCIKK3] = 8.000000e+01;
    p[C.kmTpCIKK3] = 7.000000e-01;
    p[C.kTpCu] = 1.533000e+01;
    p[C.kmTpCu] = 8.000000e-01;
    p[C.kTaB] = 1.790000e+02;
    p[C.kTaM] = 1.690000e+02;
    p[C.kTaBM] = 3.690000e+02;
    p[C.kTpaB] = 3.790000e+00;
    p[C.kTpaM] = 3.790000e+00;
    p[C.kTpaBM] = 3.790000e+00;
    p[C.kTCd] = 4.000000e+02;
    p[C.kTpCd] = 3.210000e+00;

    p[C.kIp0] = 5.500000e-02;
    p[C.kIpTAKp] = 1.930000e+00;
    p[C.kmIpTAKp] = 4.000000e-01;
    p[C.kIpTAKpC] = 3.800000e+00;
    p[C.kmIpTAKpC] = 5.800000e-01;
    p[C.kIpu] = 1.500000e+01;
    p[C.kmIpu] = 6.700000e-01;
    p[C.kICp0] = 5.100000e-02;
    p[C.kICpTAKp] = 8.640000e+00;
    p[C.kmICpTAKp] = 7.100000e+00;
    p[C.kICpTAKpC] = 1.230000e+01;
    p[C.kmICpTAKpC] = 7.177000e+00;
    p[C.kIpCu] = 1.250000e+01;
    p[C.kmIpCu] = 5.410000e+00;
    p[C.kIaB] = 3.030000e+01;
    p[C.kIaM] = 2.230000e+01;
    p[C.kIaBM] = 5.030000e+01;
    p[C.kIpaB] = 3.130000e+01;
    p[C.kIpaM] = 2.330000e+01;
    p[C.kIpaBM] = 6.030000e+01;
    p[C.kICd] = 3.280000e+01;
    p[C.kIpCd] = 1.320000e+00;
    p[C.kIpCfaIKKpC] = 1.000000e-05;
    p[C.kmIpCfaIKKpC] = 2.560000e+00;
    p[C.kIpCfaIKKppC] = 1.085700e+02;
    p[C.kmIpCfaIKKppC] = 2.010000e+00;
    p[C.kIppCu] = 1.530000e+00;
    p[C.kmIppCu] = 2.000000e-01;
    p[C.kIppCd] = 4.500000e-01;
    p[C.kIppChf] = 1.000000e-01;
    p[C.kmIppChf] = 5.000000e-01;
    p[C.kIpphf] = 9.000000e-03;
    p[C.kmIpphf] = 1.520000e+00;
    p[C.kIir] = 1.440000e+00;
    p[C.kmIir] = 3.440000e+00;
    p[C.kIpA20] = 2.000000e+01;
    p[C.kmIpA20] = 1.000000e-03;
    p[C.kIpCA20] = 2.000000e+01;
    p[C.kmIpCA20] = 1.000000e-03;


    p[C.kassaikk] = 1.631051e-03;
    p[C.kassaikknfkb] = 1.305073e+01;
    p[C.kassanfkbikk] = 4.812297e-02;
    p[C.kdisaikk] = 1.375438e-01;
    p[C.kdisaikknfkb] = 2.296074e-05;
    p[C.kdisanfkbikk] = 3.030804e-02;
    p[C.kassa] = 3.655315e+01;
    p[C.kdisa] = 3.495116e-04;
    p[C.kdegbounda] = 2.089360e-03;
    p[C.kdegboundaIKK] = 1.774837e-01;
    p[C.kdegfreea] = 2.010515e-02;
    p[C.kdegfreeaIKK] = 2.265038e-03;
    p[C.kshutboundikbain] = 4.102701e-01;
    p[C.kshutboundikbaout] = 1.632918e-01;
    p[C.kshutfreeikbain] = 1.011242e-01;
    p[C.kshutfreeikbaout] = 1.158262e-03;
    p[C.k0mrnaikba] = 3.450000e-05;
    p[C.kdegmrnaikba] = 8.326217e-02;
    p[C.khillprodmrnaikba] = 1.620503e+00;
    p[C.kpikba] = 8.484488e+00;
    p[C.kprodmrnaikba] = 1.290500e-01;

    p[C.kassbikk] = 5.609029e-03;
    p[C.kassbikknfkb] = 1.423728e+02;
    p[C.kassbnfkbikk] = 1.541680e-02;
    p[C.kdisbikk] = 2.771705e-02;
    p[C.kdisbikknfkb] = 1.742842e-03;
    p[C.kdisbnfkbikk] = 1.068148e-01;
    p[C.kassb] = 2.437209e+01;
    p[C.kdegboundb] = 2.804468e-04;
    p[C.kdegboundbIKK] = 3.645044e-01;
    p[C.kdegfreeb] = 1.486087e-01;
    p[C.kdegfreebIKK] = 2.818781e-04;
    p[C.kdisb] = 1.856372e-04;
    p[C.kshutboundikbbin] = 2.155431e-01;
    p[C.kshutboundikbbout] = 7.783843e-01;
    p[C.kshutfreeikbbin] = 1.505364e-03;
    p[C.kshutfreeikbbout] = 8.350086e-04;
    p[C.k0mrnaikbb] = 9.336099e-05;
    p[C.kdegmrnaikbb] = 4.101465e-03;
    p[C.khillprodmrnaikbb] = 0.000000e+00;
    p[C.kpikbb] = 4.171048e-02;
    p[C.kprodmrnaikbb] = 0.000000e+00;
    p[C.kasseikk] = 4.423523e-03;
    p[C.kasseikknfkb] = 1.485352e+02;
    p[C.kassenfkbikk] = 1.531672e-02;
    p[C.kdiseikk] = 3.827432e-01;
    p[C.kdiseikknfkb] = 2.124084e-04;
    p[C.kdisenfkbikk] = 2.691468e-01;

    p[C.kasse] = 2.413478e+02;
    p[C.kdegbounde] = 1.712910e-02;
    p[C.kdegboundeIKK] = 6.934859e-02;
    p[C.kdegfreee] = 2.201754e-01;
    p[C.kdegfreeeIKK] = 4.819481e-05;
    p[C.kdise] = 2.215707e-02;
    p[C.kshutboundikbein] = 8.666062e-03;
    p[C.kshutboundikbeout] = 4.006261e-02;
    p[C.kshutfreeikbein] = 1.364442e-03;
    p[C.kshutfreeikbeout] = 1.014252e-04;
    p[C.k0mrnaikbe] = 1.232627e-04;
    p[C.kdegmrnaikbe] = 9.773320e-03;
    p[C.khillprodmrnaikbe] = 1.944545e+00;
    p[C.kpikbe] = 2.384772e-01;
    p[C.kprodmrnaikbe] = 1.052365e-01;

    p[C.kshutnfkbin] = 2.072176e-01;
    p[C.kshutnfkbout] = 5.537618e-04;

    p[C.k0mrnaa20] = 1.118559e-03;
    p[C.kdegmrnaa20] = 2.809754e-01;
    p[C.kprodmrnaa20] = 1.788303e+00;
    p[C.kpa20] = 2.445338e-01;
    p[C.kdega20] = 6.217866e+00;
    p[C.khillprodmrnaa20] = 1.243583e+00;
    p[C.delayrnae] = 4.500000e+01;

    p[C.X] = 0.0;
    p[C.term] = 1.0;

    return p
end