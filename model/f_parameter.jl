const F_P = [
    "kCp0"
    "kCpB0"
    "kCpM0"
    "kCpBM0"
    "kCpS"
    "kCpBS"
    "kCpMS"
    "kCpBMS"
    "kmCpS"
    "kmCpBS"
    "kmCpMS"
    "kmCpBMS"
    "kCpu"
    "kCpBu"
    "kCpMu"
    "kCpBMu"
    "kmCpu"
    "kmCpBu"
    "kmCpMu"
    "kmCpBMu"

    "kBaM"
    "kCaB"
    "kCaM"
    "kCBaM"
    "kCMaB"
    "kCaBM"
    "kCpaBM"
    "kCpaB"
    "kCpaM"
    "kCpBaM"
    "kCpMaB"
    "kBdM"
    "kCdB"
    "kCdM"
    "kCBdM"
    "kCMdB"
    "kCpdB"
    "kCpdM"
    "kCpBdM"
    "kCpMdB"
    "kCdBM"
    "kCpdBM"

    "kTp0"
    "kCTpS"
    "kCBTpS"
    "kCMTpS"
    "kCBMTpS"
    "kmCTpS"
    "kmCBTpS"
    "kmCMTpS"
    "kmCBMTpS"
    "kTpIKK1"
    "kmTpIKK1"
    "kTpu"
    "kmTpu"
    "kTpC0"
    "kCTpCS"
    "kCBTpCS"
    "kCMTpCS"
    "kCBMTpCS"
    "kmCTpCS"
    "kmCBTpCS"
    "kmCMTpCS"
    "kmCBMTpCS"
    "kTpCIKK1"
    "kmTpCIKK1"
    "kTpCIKK2"
    "kmTpCIKK2"
    "kTpCIKK3"
    "kmTpCIKK3"
    "kTpCu"
    "kmTpCu"
    "kTaB"
    "kTaM"
    "kTaBM"
    "kTpaB"
    "kTpaM"
    "kTpaBM"
    "kTCd"
    "kTpCd"

    "kIp0"
    "kIpTAKp"
    "kmIpTAKp"
    "kIpTAKpC"
    "kmIpTAKpC"
    "kIpu"
    "kmIpu"
    "kICp0"
    "kICpTAKp"
    "kmICpTAKp"
    "kICpTAKpC"
    "kmICpTAKpC"
    "kIpCu"
    "kmIpCu"
    "kIaB"
    "kIaM"
    "kIaBM"
    "kIpaB"
    "kIpaM"
    "kIpaBM"
    "kICd"
    "kIpCd"
    "kIpCfaIKKpC"
    "kmIpCfaIKKpC"
    "kIpCfaIKKppC"
    "kmIpCfaIKKppC"
    "kIppCu"
    "kmIppCu"
    "kIppCd"
    "kIppChf"
    "kmIppChf"
    "kIpphf"
    "kmIpphf"
    "kIir"
    "kmIir"
    "kIpA20"
    "kmIpA20"
    "kIpCA20"
    "kmIpCA20"


    "kassaikk"
    "kassaikknfkb"
    "kassanfkbikk"
    "kdisaikk"
    "kdisaikknfkb"
    "kdisanfkbikk"
    "kassa"
    "kdisa"
    "kdegbounda"
    "kdegboundaIKK"
    "kdegfreea"
    "kdegfreeaIKK"
    "kshutboundikbain"
    "kshutboundikbaout"
    "kshutfreeikbain"
    "kshutfreeikbaout"
    "k0mrnaikba"
    "kdegmrnaikba"
    "khillprodmrnaikba"
    "kpikba"
    "kprodmrnaikba"

    "kassbikk"
    "kassbikknfkb"
    "kassbnfkbikk"
    "kdisbikk"
    "kdisbikknfkb"
    "kdisbnfkbikk"
    "kassb"
    "kdegboundb"
    "kdegboundbIKK"
    "kdegfreeb"
    "kdegfreebIKK"
    "kdisb"
    "kshutboundikbbin"
    "kshutboundikbbout"
    "kshutfreeikbbin"
    "kshutfreeikbbout"
    "k0mrnaikbb"
    "kdegmrnaikbb"
    "khillprodmrnaikbb"
    "kpikbb"
    "kprodmrnaikbb"
    "kasseikk"
    "kasseikknfkb"
    "kassenfkbikk"
    "kdiseikk"
    "kdiseikknfkb"
    "kdisenfkbikk"

    "kasse"
    "kdegbounde"
    "kdegboundeIKK"
    "kdegfreee"
    "kdegfreeeIKK"
    "kdise"
    "kshutboundikbein"
    "kshutboundikbeout"
    "kshutfreeikbein"
    "kshutfreeikbeout"
    "k0mrnaikbe"
    "kdegmrnaikbe"
    "khillprodmrnaikbe"
    "kpikbe"
    "kprodmrnaikbe"

    "kshutnfkbin"
    "kshutnfkbout"

    "k0mrnaa20"
    "kdegmrnaa20"
    "kprodmrnaa20"
    "kpa20"
    "kdega20"
    "khillprodmrnaa20"
    "delayrnae"
    "X"
    "term"
];

for (index,value) in enumerate(F_P)
    eval(Meta.parse("const $value=$index"));
end

function f_params()
    p = zeros(length(F_P))

    p[kCp0] = 1.000000e-04;
    p[kCpB0] = 1.000000e-04;
    p[kCpM0] = 1.000000e-04;
    p[kCpBM0] = 1.000000e-04;
    p[kCpS] = 7.000000e+00;
    p[kCpBS] = 2.000000e+01;
    p[kCpMS] = 1.700000e+01;
    p[kCpBMS] = 1.000000e+00;
    p[kmCpS] = 1.000000e+00;
    p[kmCpBS] = 1.000000e+00;
    p[kmCpMS] = 1.000000e+00;
    p[kmCpBMS] = 5.000000e+00;
    p[kCpu] = 7.500000e-01;
    p[kCpBu] = 1.950000e+00;
    p[kCpMu] = 3.750000e+00;
    p[kCpBMu] = 2.500000e-01;
    p[kmCpu] = 1.000000e+00;
    p[kmCpBu] = 1.000000e+00;
    p[kmCpMu] = 1.000000e+00;
    p[kmCpBMu] = 2.500000e+00;

    p[kBaM] = 5.000000e-01;
    p[kCaB] = 5.000000e-01;
    p[kCaM] = 5.000000e-01;
    p[kCBaM] = 1.500000e+00;
    p[kCMaB] = 5.000000e-01;
    p[kCaBM] = 5.000000e-01;
    p[kCpaBM] = 1.885000e+00;
    p[kCpaB] = 7.885000e+00;
    p[kCpaM] = 4.585000e+00;
    p[kCpBaM] = 2.500000e+00;
    p[kCpMaB] = 1.500000e+00;
    p[kBdM] = 2.500000e+00;
    p[kCdB] = 1.000000e+00;
    p[kCdM] = 2.500000e+00;
    p[kCBdM] = 1.500000e+00;
    p[kCMdB] = 2.500000e+00;
    p[kCpdB] = 3.000000e-01;
    p[kCpdM] = 3.000000e-01;
    p[kCpBdM] = 1.500000e-01;
    p[kCpMdB] = 4.500000e-01;
    p[kCdBM] = 2.000000e-01;
    p[kCpdBM] = 2.500000e-01;

    p[kTp0] = 2.700000e-01;
    p[kCTpS] = 3.200000e-01;
    p[kCBTpS] = 1.320000e+00;
    p[kCMTpS] = 1.320000e+00;
    p[kCBMTpS] = 1.320000e+00;
    p[kmCTpS] = 2.100000e+00;
    p[kmCBTpS] = 2.100000e+00;
    p[kmCMTpS] = 2.100000e+00;
    p[kmCBMTpS] = 2.100000e+00;
    p[kTpIKK1] = 1.670000e+01;
    p[kmTpIKK1] = 7.800000e-01;
    p[kTpu] = 3.400000e+00;
    p[kmTpu] = 1.790000e+00;
    p[kTpC0] = 3.300000e-01;
    p[kCTpCS] = 5.500000e+00;
    p[kCBTpCS] = 1.750000e+01;
    p[kCMTpCS] = 1.650000e+01;
    p[kCBMTpCS] = 2.450000e+01;
    p[kmCTpCS] = 5.200000e-01;
    p[kmCBTpCS] = 5.200000e-01;
    p[kmCMTpCS] = 5.200000e-01;
    p[kmCBMTpCS] = 5.200000e-01;
    p[kTpCIKK1] = 1.000000e+01;
    p[kmTpCIKK1] = 7.800000e-01;
    p[kTpCIKK2] = 1.710000e+01;
    p[kmTpCIKK2] = 1.300000e-01;
    p[kTpCIKK3] = 8.000000e+01;
    p[kmTpCIKK3] = 7.000000e-01;
    p[kTpCu] = 1.533000e+01;
    p[kmTpCu] = 8.000000e-01;
    p[kTaB] = 1.790000e+02;
    p[kTaM] = 1.690000e+02;
    p[kTaBM] = 3.690000e+02;
    p[kTpaB] = 3.790000e+00;
    p[kTpaM] = 3.790000e+00;
    p[kTpaBM] = 3.790000e+00;
    p[kTCd] = 4.000000e+02;
    p[kTpCd] = 3.210000e+00;

    p[kIp0] = 5.500000e-02;
    p[kIpTAKp] = 1.930000e+00;
    p[kmIpTAKp] = 4.000000e-01;
    p[kIpTAKpC] = 3.800000e+00;
    p[kmIpTAKpC] = 5.800000e-01;
    p[kIpu] = 1.500000e+01;
    p[kmIpu] = 6.700000e-01;
    p[kICp0] = 5.100000e-02;
    p[kICpTAKp] = 8.640000e+00;
    p[kmICpTAKp] = 7.100000e+00;
    p[kICpTAKpC] = 1.230000e+01;
    p[kmICpTAKpC] = 7.177000e+00;
    p[kIpCu] = 1.250000e+01;
    p[kmIpCu] = 5.410000e+00;
    p[kIaB] = 3.030000e+01;
    p[kIaM] = 2.230000e+01;
    p[kIaBM] = 5.030000e+01;
    p[kIpaB] = 3.130000e+01;
    p[kIpaM] = 2.330000e+01;
    p[kIpaBM] = 6.030000e+01;
    p[kICd] = 3.280000e+01;
    p[kIpCd] = 1.320000e+00;
    p[kIpCfaIKKpC] = 1.000000e-05;
    p[kmIpCfaIKKpC] = 2.560000e+00;
    p[kIpCfaIKKppC] = 1.085700e+02;
    p[kmIpCfaIKKppC] = 2.010000e+00;
    p[kIppCu] = 1.530000e+00;
    p[kmIppCu] = 2.000000e-01;
    p[kIppCd] = 4.500000e-01;
    p[kIppChf] = 1.000000e-01;
    p[kmIppChf] = 5.000000e-01;
    p[kIpphf] = 9.000000e-03;
    p[kmIpphf] = 1.520000e+00;
    p[kIir] = 1.440000e+00;
    p[kmIir] = 3.440000e+00;
    p[kIpA20] = 2.000000e+01;
    p[kmIpA20] = 1.000000e-03;
    p[kIpCA20] = 2.000000e+01;
    p[kmIpCA20] = 1.000000e-03;


    p[kassaikk] = 1.631051e-03;
    p[kassaikknfkb] = 1.305073e+01;
    p[kassanfkbikk] = 4.812297e-02;
    p[kdisaikk] = 1.375438e-01;
    p[kdisaikknfkb] = 2.296074e-05;
    p[kdisanfkbikk] = 3.030804e-02;
    p[kassa] = 3.655315e+01;
    p[kdisa] = 3.495116e-04;
    p[kdegbounda] = 2.089360e-03;
    p[kdegboundaIKK] = 1.774837e-01;
    p[kdegfreea] = 2.010515e-02;
    p[kdegfreeaIKK] = 2.265038e-03;
    p[kshutboundikbain] = 4.102701e-01;
    p[kshutboundikbaout] = 1.632918e-01;
    p[kshutfreeikbain] = 1.011242e-01;
    p[kshutfreeikbaout] = 1.158262e-03;
    p[k0mrnaikba] = 3.450000e-05;
    p[kdegmrnaikba] = 8.326217e-02;
    p[khillprodmrnaikba] = 1.620503e+00;
    p[kpikba] = 8.484488e+00;
    p[kprodmrnaikba] = 1.290500e-01;

    p[kassbikk] = 5.609029e-03;
    p[kassbikknfkb] = 1.423728e+02;
    p[kassbnfkbikk] = 1.541680e-02;
    p[kdisbikk] = 2.771705e-02;
    p[kdisbikknfkb] = 1.742842e-03;
    p[kdisbnfkbikk] = 1.068148e-01;
    p[kassb] = 2.437209e+01;
    p[kdegboundb] = 2.804468e-04;
    p[kdegboundbIKK] = 3.645044e-01;
    p[kdegfreeb] = 1.486087e-01;
    p[kdegfreebIKK] = 2.818781e-04;
    p[kdisb] = 1.856372e-04;
    p[kshutboundikbbin] = 2.155431e-01;
    p[kshutboundikbbout] = 7.783843e-01;
    p[kshutfreeikbbin] = 1.505364e-03;
    p[kshutfreeikbbout] = 8.350086e-04;
    p[k0mrnaikbb] = 9.336099e-05;
    p[kdegmrnaikbb] = 4.101465e-03;
    p[khillprodmrnaikbb] = 0.000000e+00;
    p[kpikbb] = 4.171048e-02;
    p[kprodmrnaikbb] = 0.000000e+00;
    p[kasseikk] = 4.423523e-03;
    p[kasseikknfkb] = 1.485352e+02;
    p[kassenfkbikk] = 1.531672e-02;
    p[kdiseikk] = 3.827432e-01;
    p[kdiseikknfkb] = 2.124084e-04;
    p[kdisenfkbikk] = 2.691468e-01;

    p[kasse] = 2.413478e+02;
    p[kdegbounde] = 1.712910e-02;
    p[kdegboundeIKK] = 6.934859e-02;
    p[kdegfreee] = 2.201754e-01;
    p[kdegfreeeIKK] = 4.819481e-05;
    p[kdise] = 2.215707e-02;
    p[kshutboundikbein] = 8.666062e-03;
    p[kshutboundikbeout] = 4.006261e-02;
    p[kshutfreeikbein] = 1.364442e-03;
    p[kshutfreeikbeout] = 1.014252e-04;
    p[k0mrnaikbe] = 1.232627e-04;
    p[kdegmrnaikbe] = 9.773320e-03;
    p[khillprodmrnaikbe] = 1.944545e+00;
    p[kpikbe] = 2.384772e-01;
    p[kprodmrnaikbe] = 1.052365e-01;

    p[kshutnfkbin] = 2.072176e-01;
    p[kshutnfkbout] = 5.537618e-04;

    p[k0mrnaa20] = 1.118559e-03;
    p[kdegmrnaa20] = 2.809754e-01;
    p[kprodmrnaa20] = 1.788303e+00;
    p[kpa20] = 2.445338e-01;
    p[kdega20] = 6.217866e+00;
    p[khillprodmrnaa20] = 1.243583e+00;
    p[delayrnae] = 4.500000e+01;

    p[X] = 0.0;
    p[term] = 1.0;

    return p
end