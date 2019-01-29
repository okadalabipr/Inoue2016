function MA(k,S)
    return k*S
end

function MAcom2(k,S1,S2)
    return k*S1*S2
end

function MM(k,Km,S)
    return k*S/(Km+S)
end

function Hill2(A,n)
    return A^n
end

function libPulseDelay(t,X,term)
    #signal parameter
    sinput = 1.0 - (1.0 - 0.01)*X;
    sbase = 0.01;
    slate = 0.05 - (0.05 - 0.01)*X;
    tpulse = 0.25;
    traise = 0.5;
    tdecay = 0.5;
    tdelay = 0.0;

    if t <= tdelay || term == 1.0
        return sbase
    elseif tdelay < t <= (traise + tdelay)
        return (t - tdelay)*(sinput - sbase)/traise + sbase
    elseif (traise + tdelay) < t <= (tpulse + traise + tdelay)
        return sinput
    elseif (tpulse + traise + tdelay) < t
        return (sinput - slate)*exp(-(t - tpulse - traise - tdelay)/tdecay) + slate
    else
        return 0.0
    end
end

function diffeq(du,u,h,p,t)

    #IKK activity
    IKKa = u[IKKp] + u[IKKpC] + u[IKKppC] + u[IKKpp];
    if IKKa == 0.0
        IKKa = 1.0;
    end

    ##### time delay
    NFKBnDelay = h(p,t-p[delayrnae])[NFKBn];

    ###################----CBM module----#######################
    signal = libPulseDelay(t,p[X],p[term]);

    v = zeros(161);

    v[1] = MA(p[kCp0], u[C]);                                                        #(*basal C phosphorylation*)
    v[2] = signal * MM(p[kCpS], p[kmCpS], u[C]);                                     #(*signal-dependent C phosphorylation*)
    v[3] = MM(p[kCpu], p[kmCpu], u[Cp]);                                             #(* Cp dephosphorylation*)
    v[4] = MA(p[kCpB0], u[CB]);                                                      #(*basal CB phosphorylation*)
    v[5] = signal * MM(p[kCpBS], p[kmCpBS], u[CB]);                                  #(*signal-dependent CB phosphorylation*)
    v[6] = MM(p[kCpBu], p[kmCpBu], u[CpB]);                                          #(* CpB dephosphorylation*)
    v[7] = MA(p[kCpM0], u[CM]);                                                      #(*basal CM phosphorylation*)
    v[8] = signal * MM(p[kCpMS], p[kmCpMS], u[CM]);                                  #(*signal-dependent CM phosphorylation*)
    v[9] = MM(p[kCpMu], p[kmCpMu], u[CpM]);                                          #(* CpM dephosphorylation*)
    v[10] = MA(p[kCpBM0], u[CBM]);                                                   #(*basal CBM phosphorylation*)
    v[11] = signal * MM(p[kCpBMS], p[kmCpBMS], u[CBM]);                              #(*signal-dependent CBM phosphorylation*)
    v[12] = MM(p[kCpBMu], p[kmCpBMu], u[CpBM]);                                      #(* CpBM dephosphorylation*)
    v[13] = MAcom2(p[kBaM], u[B], u[M]);                                             #(*association between B and M*)
    v[14] = MA(p[kBdM], u[BM]);                                                      #(*disassociation between B and M*)
    v[15] = MAcom2(p[kCaB], u[C], u[B]);                                             #(*association between C and B*)
    v[16] = MA(p[kCdB], u[CB]);                                                      #(*disassociation between C and B*)
    v[17] = MAcom2(p[kCpaB], u[Cp], u[B]);                                           #(*association between Cp and B*)
    v[18] = MA(p[kCpdB], u[CpB]);                                                    #(*disassociation between Cp and B*)
    v[19] = MAcom2(p[kCaM], u[C], u[M]);                                             #(*association between C and M*)
    v[20] = MA(p[kCdM], u[CM]);                                                      #(*disassociation between C and M*)
    v[21] = MAcom2(p[kCpaM], u[Cp], u[M]);                                           #(*association between Cp and M*)
    v[22] = MA(p[kCpdM], u[CpM]);                                                    #(*disassociation between Cp and M*)
    v[23] = MAcom2(p[kCBaM], u[CB], u[M]);                                           #(*association between CB and M*)
    v[24] = MA(p[kCBdM], u[CBM]);                                                    #(*disassociation between CB and M*)
    v[25] = MAcom2(p[kCpBaM], u[CpB], u[M]);                                         #(*association between CpB and M*)
    v[26] = MA(p[kCpBdM], u[CpBM]);                                                  #(*disassociation between CpB and M*)
    v[27] = MAcom2(p[kCMaB], u[CM], u[B]);                                           #(*association between CM and B*)
    v[28] = MA(p[kCMdB], u[CBM]);                                                    #(*disassociation between CM and B*)
    v[29] = MAcom2(p[kCpMaB], u[CpM], u[B]);                                         #(*association between CpM and B*)
    v[30] = MA(p[kCpMdB], u[CpBM]);                                                  #(*disassociation between CpM and B*)
    v[31] = MAcom2(p[kCaBM], u[C], u[BM]);                                           #(*association between C and BM*)
    v[32] = MA(p[kCdBM], u[CBM]);                                                    #(*disassociation between C and BM*)
    v[33] = MAcom2(p[kCpaBM], u[Cp], u[BM]);                                         #(*association between Cp and BM*)
    v[34] = MA(p[kCpdBM], u[CpBM]);                                                  #(*disassociation between Cp and BM*)
    ###################----CBM module----#######################

    ###################----TAK1 module----######################
    v[35] = MA(p[kTp0], u[TAK1]);                                                    #(*basal TAK1 phosphorylation*)
    v[36] = u[Cp] * MM(p[kCTpS], p[kmCTpS], u[TAK1]);                                #(*Cp-dependent TAK1 phosphorylation*)
    v[37] = u[CpB] * MM(p[kCBTpS], p[kmCBTpS], u[TAK1]);                             #(*CpB-dependent TAK1 phosphorylation*)
    v[38] = u[CpM] * MM(p[kCMTpS], p[kmCMTpS], u[TAK1]);                             #(*CpM-dependent TAK1 phosphorylation*)
    v[39] = u[CpBM] * MM(p[kCBMTpS], p[kmCBMTpS], u[TAK1]);                          #(*CpBM-dependent TAK1 phosphorylation*)
    v[40] = u[IKKp] * MM(p[kTpIKK1], p[kmTpIKK1], u[TAK1]);                          #(*IKKp-dependent TAK1 phosphorylation*)
    v[41] = MM(p[kTpu], p[kmTpu], u[TAK1p]);                                         #(*TAK1 dephosphorylation*)
    v[42] = MA(p[kTpC0], u[TAK1C]);                                                  #(*basal TAK1C phosphorylation*)
    v[43] = u[Cp] * MM(p[kCTpCS], p[kmCTpCS], u[TAK1C]);                             #(*Cp-dependent TAK1C phosphorylation*)
    v[44] = u[CpB] * MM(p[kCBTpCS], p[kmCBTpCS], u[TAK1C]);                          #(*CpB-dependent TAK1C phosphorylation*)
    v[45] = u[CpM] * MM(p[kCMTpCS], p[kmCMTpCS], u[TAK1C]);                          #(*CpM-dependent TAK1C phosphorylation*)
    v[46] = u[CpBM] * MM(p[kCBMTpCS], p[kmCBMTpCS], u[TAK1C]);                       #(*CpBM-dependent TAK1C phosphorylation*)
    v[47] = u[IKKp] * MM(p[kTpCIKK1], p[kmTpCIKK1], u[TAK1C]);                       #(*IKKp-dependent TAK1C phosphorylation*)
    v[48] = u[IKKpC] * MM(p[kTpCIKK2], p[kmTpCIKK2], u[TAK1C]);                      #(*IKKpC-dependent TAK1C phosphorylation*)
    v[49] = u[IKKppC] * MM(p[kTpCIKK3], p[kmTpCIKK3], u[TAK1C]);                     #(*IKKppC-dependent TAK1C phosphorylation*)
    v[50] = MM(p[kTpCu], p[kmTpCu], u[TAK1pC]);                                      #(*basal TAK1C dephosphorylation*)
    v[51] = MAcom2(p[kTaB], (u[CB] + u[CpB]), u[TAK1]);                              #(*association between TAK1 and CB*)
    v[52] = MAcom2(p[kTaM], (u[CM] + u[CpM]), u[TAK1]);                              #(*association between TAK1 and CM*)
    v[53] = MAcom2(p[kTaBM], (u[CBM] + u[CpBM]), u[TAK1]);                           #(*association between TAK1 and CBM*)
    v[54] = MA(p[kTCd], u[TAK1C]);                                                   #(*dissociation between TAK1 and CBM*)
    v[55] = MAcom2(p[kTpaB], (u[CB] + u[CpB]), u[TAK1p]);                            #(*association between TAK1p and CBM*)
    v[56] = MAcom2(p[kTpaM], (u[CM] + u[CpM]), u[TAK1p]);                            #(*association between TAK1p and CBM*)
    v[57] = MAcom2(p[kTpaBM], (u[CBM] + u[CpBM]), u[TAK1p]);                         #(*association between TAK1p and CBM*)
    v[58] = MA(p[kTpCd], u[TAK1pC]);                                                 #(*dissociation between TAK1 and CBM*)
    ###################----TAK1 module----######################

    ###################----IKK module----#######################
    v[59] = MA(p[kIp0], u[IKK]);                                                     #(*basal IKK phosphorylation*)
    v[60] = u[TAK1p] * MM(p[kIpTAKp], p[kmIpTAKp], u[IKK]);                          #(*TAK1p-dependent IKK phosphorylation*)
    v[61] = u[TAK1pC] * MM(p[kIpTAKpC], p[kmIpTAKpC], u[IKK]);                       #(*TAKpC-dependent IKK phosphorylation*)
    v[62] = MA(p[kICp0], u[IKKC]);                                                   #(*basal IKKC phosphorylation*)
    v[63] = u[TAK1p] * MM(p[kICpTAKp], p[kmICpTAKp], u[IKKC]);                       #(*TAK1p-dependent IKKC phosphorylation*)
    v[64] = u[TAK1pC] * MM(p[kICpTAKpC], p[kmICpTAKpC], u[IKKC]);                    #(*TAK1pC-dependent IKKC phosphorylation*)
    v[65] = MM(p[kIpu], p[kmIpu], u[IKKp]);                                          #(*IKKp dephosphorylation*)
    v[66] = MM(p[kIpCu], p[kmIpCu], u[IKKpC]);                                       #(*IKKpC dephosphorylation*)
    v[67] = MAcom2(p[kIaB], (u[CB] + u[CpB]), u[IKK]);                               #(*association between IKK and CB*)
    v[68] = MAcom2(p[kIaM], (u[CM] + u[CpM]), u[IKK]);                               #(*association between IKK and CM*)
    v[69] = MAcom2(p[kIaBM], (u[CBM] + u[CpBM]), u[IKK]);                            #(*association between IKK and CBM*)
    v[70] = MA(p[kICd], u[IKKC]);                                                    #(*dissociation between IKK and CBM*)
    v[71] = MAcom2(p[kIpaB], (u[CB] + u[CpB]), u[IKKp]);                             #(*association between IKKp and CB*)
    v[72] = MAcom2(p[kIpaM], (u[CM] + u[CpM]), u[IKKp]);                             #(*association between IKKp and CM*)
    v[73] = MAcom2(p[kIpaBM], (u[CBM] + u[CpBM]), u[IKKp]);                          #(*association between IKKp and CBM*)
    v[74] = MA(p[kIpCd], u[IKKpC]);                                                  #(*dissociation between IKKp and CBM*)
    v[75] = MM(p[kIpCfaIKKpC], p[kmIpCfaIKKpC], u[IKKpC]);                           #(*basal IKKpC phosphorylation*)
    v[76] = u[IKKppC] * MM(p[kIpCfaIKKppC], p[kmIpCfaIKKppC], u[IKKpC]);             #(*IKKppC-dependent IKKpC phosphorylation*)
    v[77] = MM(p[kIppCu], p[kmIppCu], u[IKKppC]);                                    #(*basal IKKppC dephosphorylation*)
    v[78] = MA(p[kIppCd], u[IKKppC]);                                                #(*dissociation between IKKpp and CBM (IKKppC->IKKpp*)
    v[79] = MM(p[kIpphf], p[kmIpphf], u[IKKpp]);                                     #(*basal IKKpp inactivation (IKKpp->IKKi)*)
    v[80] = MM(p[kIppChf], p[kmIppChf], u[IKKppC]);                                  #(*basal IKKppC inactivation (IKKppC->IKKi)*)
    v[81] = MM(p[kIir], p[kmIir], u[IKKi]);                                          #(* recycling (IKKi->IKK)*)
    v[82] = u[A20c] * MM(p[kIpA20], p[kmIpA20], u[IKKp]);                            #(* A20-dependent IKKp phosphorylation inhibition *)
    v[83] = u[A20c] * MM(p[kIpCA20], p[kmIpCA20], u[IKKpC]);                         #(* A20-dependent IKKpC phosphorylation inhibition *)
    ###################----IKK module----#######################

    ########----IKKNFkBIkB module----################
    v[84] = MAcom2(p[kassanfkbikk], IKKa, u[NFKBIKBac]);                             #(*association between IKKa and NFkBIkBac*)
    v[85] = MAcom2(p[kassbnfkbikk], IKKa, u[NFKBIKBbc]);                             #(*association between IKKa and NFkBIkBbc*)
    v[86] = MAcom2(p[kassenfkbikk], IKKa, u[NFKBIKBec]);                             #(*association between IKKa and NFkBIkBec*)
    v[87] = MA(p[kdisanfkbikk], u[IKKNFKBIKBac]);                                    #(*dissociation between IKKa and NFkBIkBac*)
    v[88] = MA(p[kdisbnfkbikk], u[IKKNFKBIKBbc]);                                    #(*dissociation between IKKa and NFkBIkBbc*)
    v[89] = MA(p[kdisenfkbikk], u[IKKNFKBIKBec]);                                    #(*dissociation between IKKa and NFkBIkBec*)
    v[90] = MA(p[kdegboundaIKK], u[IKKNFKBIKBac]);                                   #(*dissociation between IKKa and NFkBc and degradation of IkBac*)
    v[91] = MA(p[kdegboundbIKK], u[IKKNFKBIKBbc]);                                   #(*dissociation between IKKa and NFkBc and degradation of IkBbc*)
    v[92] = MA(p[kdegboundeIKK], u[IKKNFKBIKBec]);                                   #(*dissociation between IKKa and NFkBc and degradation of IkBec*)
    v[93] = MAcom2(p[kassaikk], u[IKBac], IKKa);                                     #(*association between IKKa and IkBac*)
    v[94] = MAcom2(p[kassbikk], u[IKBbc], IKKa);                                     #(*association between IKKa and IkBbc*)
    v[95] = MAcom2(p[kasseikk], u[IKBec], IKKa);                                     #(*association between IKKa and IkBec*)
    v[96] = MA(p[kdisaikk], u[IKKIKBac]);                                            #(*dissociation between IKKa and IkBac*)
    v[97] = MA(p[kdisbikk], u[IKKIKBbc]);                                            #(*dissociation between IKKa and IkBbc*)
    v[98] = MA(p[kdiseikk], u[IKKIKBec]);                                            #(*dissociation between IKKa and IkBec*)
    v[99] = MA(p[kdegfreeaIKK], u[IKKIKBac]);                                        #(*dissociation of IKKa and degradation of IkBac*)
    v[100] = MA(p[kdegfreebIKK], u[IKKIKBbc]);                                       #(*dissociation of IKKa and degradation of IkBbc*)
    v[101] = MA(p[kdegfreeeIKK], u[IKKIKBec]);                                       #(*dissociation of IKKa and degradation of IkBec*)
    ########----IKKNFkBIkB module----################

    ###################----NFkB module----######################
    v[102] = MAcom2(p[kassa], u[IKBac], u[NFKBc]);                                  #(*association between NFkBc and IkBac*)
    v[103] = MA(p[kdisa], u[NFKBIKBac]);                                            #(*dissociation between NFkBc and IkBac*)
    v[104] = MA(p[kdegbounda], u[NFKBIKBac]);                                       #(*dissociation of NFkBc and degradation of IkBac*)
    v[105] = MAcom2(p[kassaikknfkb], u[IKKIKBac], u[NFKBc]);                        #(*association between NFkBc and IKKaIkBac*)
    v[106] = MA(p[kdisaikknfkb], u[IKKNFKBIKBac]);                                  #(*dissociation between NFkBc and IKKaIkBac*)
    v[107] = MAcom2(p[kassa], u[IKBan], u[NFKBn]);                                  #(*association between NFkBn and IkBan*)
    v[108] = MA(p[kdisa], u[NFKBIKBan]);                                            #(*dissociation between NFkBn and IkBan*)
    v[109] = MA(p[kdegbounda], u[NFKBIKBan]);                                       #(*dissociation of NFkBn and degradation of IkBan*)

    v[110] = MAcom2(p[kassb], u[IKBbc], u[NFKBc]);                                  #(*association between NFkBc and IkBbc*)
    v[111] = MA(p[kdisb], u[NFKBIKBbc]);                                            #(*dissociation between NFkBc and IkBbc*)
    v[112] = MA(p[kdegboundb], u[NFKBIKBbc]);                                       #(*dissociation of NFkBc and degradation of IkBbc*)
    v[113] = MAcom2(p[kassbikknfkb], u[IKKIKBbc], u[NFKBc]);                        #(*association between NFkBc and IKKaIkBbc*)
    v[114] = MA(p[kdisbikknfkb], u[IKKNFKBIKBbc]);                                  #(*dissociation between NFkBc and IKKaIkBbc*)
    v[115] = MAcom2(p[kassb], u[IKBbn], u[NFKBn]);                                  #(*association between NFkBn and IkBbn*)
    v[116] = MA(p[kdisb], u[NFKBIKBbn]);                                            #(*dissociation between NFkBn and IkBbn*)
    v[117] = MA(p[kdegboundb], u[NFKBIKBbn]);                                       #(*dissociation of NFkBn and degradation of IkBbn*)

    v[118] = MAcom2(p[kasse], u[IKBec], u[NFKBc]);                                  #(*association between NFkBc and IkBec*)
    v[119] = MA(p[kdise], u[NFKBIKBec]);                                            #(*dissociation between NFkBc and IkBec*)
    v[120] = MA(p[kdegbounde], u[NFKBIKBec]);                                       #(*dissociation of NFkBc and degradation of IkBec*)
    v[121] = MAcom2(p[kasseikknfkb], u[IKKIKBec], u[NFKBc]);                        #(*association between NFkBc and IKKaIkBec*)
    v[122] = MA(p[kdiseikknfkb], u[IKKNFKBIKBec]);                                  #(*dissociation between NFkBc and IKKaIkBec*)
    v[123] = MAcom2(p[kasse], u[IKBen], u[NFKBn]);                                  #(*association between NFkBn and IkBen*)
    v[124] = MA(p[kdise], u[NFKBIKBen]);                                            #(*dissociation between NFkBn and IkBen*)
    v[125] = MA(p[kdegbounde], u[NFKBIKBen]);                                       #(*dissociation of NFkBn and degradation of IkBen*)

    v[126] = MA(p[kshutboundikbain], u[NFKBIKBac]);                                 #(*transport NFkBIkBac into nucleos*)
    v[127] = MA(p[kshutboundikbaout], u[NFKBIKBan]);                                #(*transport NFkBIkBan into cytoplasm*)
    v[128] = MA(p[kshutboundikbbin], u[NFKBIKBbc]);                                 #(*transport NFkBIkBbc into nucleos*)
    v[129] = MA(p[kshutboundikbbout], u[NFKBIKBbn]);                                #(*transport NFkBIkBbn into cytoplasm*)
    v[130] = MA(p[kshutboundikbein], u[NFKBIKBec]);                                 #(*transport NFkBIkBec into nucleos*)
    v[131] = MA(p[kshutboundikbeout], u[NFKBIKBen]);                                #(*transport NFkBIkBen into cytoplasm*)
    v[132] = MA(p[kshutfreeikbain], u[IKBac]);                                      #(*transport IkBac into nucleos*)
    v[133] = MA(p[kshutfreeikbaout], u[IKBan]);                                     #(*transport IkBan into cytoplasm*)
    v[134] = MA(p[kshutfreeikbbin], u[IKBbc]);                                      #(*transport IkBbc into nucleos*)
    v[135] = MA(p[kshutfreeikbbout], u[IKBbn]);                                     #(*transport IkBbn into cytoplasm*)
    v[136] = MA(p[kshutfreeikbein], u[IKBec]);                                      #(*transport IkBec into nucleos*)
    v[137] = MA(p[kshutfreeikbeout], u[IKBen]);                                     #(*transport IkBen into cytoplasm*)
    v[138] = MA(p[kshutnfkbin], u[NFKBc]);                                          #(*transport NFkBc into nucleos*)
    v[139] = MA(p[kshutnfkbout], u[NFKBn]);                                         #(*transport NFkBn into cytoplasm*)

    v[140] = p[k0mrnaikba];                                                         #(*basal mRNA(IkBa) transcription*)
    v[141] = p[kprodmrnaikba] * Hill2(u[NFKBn], p[khillprodmrnaikba]);              #(*NFkB-induced IkBa transcription*)
    v[142] = MA(p[kdegmrnaikba], u[mRNAac]);                                        #(*mRNA(IkBa) degradation*)
    v[143] = MA(p[kpikba], u[mRNAac]);                                              #(*mRNA(IkBa) translation*)
    v[144] = MA(p[kdegfreea], u[IKBac]);                                            #(*IkBac degradation*)
    v[145] = MA(p[kdegfreea], u[IKBan]);                                            #(*IkBan degradation*)

    v[146] = p[k0mrnaikbb];                                                         #(*basal mRNA(IkBb) transcription*)
    v[147] = MA(p[kdegmrnaikbb], u[mRNAbc]);                                        #(*mRNA(IkBb) degradation*)
    v[148] = MA(p[kpikbb], u[mRNAbc]);                                              #(*mRNA(IkBb) translation*)
    v[149] = MA(p[kdegfreeb], u[IKBbc]);                                            #(*IkBbc degradation*)
    v[150] = MA(p[kdegfreeb], u[IKBbn]);                                            #(*IkBbn degradation*)

    v[151] = p[k0mrnaikbe];                                                         #(*basal mRNA(IkBe) transcription*)
    v[152] = p[kprodmrnaikbe] * Hill2(NFKBnDelay, p[khillprodmrnaikbe]);            #(*NFkB-induced IkBe transcription*)
    v[153] = MA(p[kdegmrnaikbe], u[mRNAec]);                                        #(*mRNA(IkBe) degradation*)
    v[154] = MA(p[kpikbe], u[mRNAec]);                                              #(*mRNA(IkBe) translation*)
    v[155] = MA(p[kdegfreee], u[IKBec]);                                            #(*IkBec degradation*)
    v[156] = MA(p[kdegfreee], u[IKBen]);                                            #(*IkBen degradation*)

    v[157] = p[k0mrnaa20];                                                          #(*basal mRNA(A20) transcription*)
    v[158] = p[kprodmrnaa20] * Hill2(u[NFKBn], p[khillprodmrnaa20]);                #(*NFkB-induced A20 transcription*)
    v[159] = MA(p[kdegmrnaa20], u[mRNAa20c]);                                       #(*mRNA(A20) degradation*)
    v[160] = MA(p[kpa20], u[mRNAa20c]);                                             #(*mRNA(A20) translation*)
    v[161] = MA(p[kdega20], u[A20c]);                                               #(*A20 degradation*)

    IKKaNFKBIKB = - v[93] - v[94] - v[95] + v[99] + v[96] + v[100] + v[97] + v[101] + v[98] + v[90] + v[87] +
                    v[91] + v[88] + v[92] + v[89] - v[84] - v[85] - v[86];

    ###################----CBM module----######################
    du[B] = (- v[15] + v[16]) + (- v[17] + v[18]) + (- v[27] + v[28]) + (- v[29] + v[30]) + (- v[13] + v[14]);
    du[M] = (- v[19] + v[20]) + (- v[21] + v[22]) + (- v[23] + v[24]) + (- v[25] + v[26]) + (- v[13] + v[14]);
    du[BM] = ( v[13] - v[14]) + (- v[31] + v[32]) + (- v[33] + v[34]);
    du[C] = (- v[15] + v[16]) + (- v[19] + v[20]) + (- v[31] + v[32]) + ( v[3] -(v[1] + v[2]) );
    du[CB] = (v[15] - v[16]) + (- v[23] + v[24]) + ( v[6] -(v[4] + v[5]) );
    du[CM] = (v[19] - v[20]) + (- v[27] + v[28]) + ( v[9] -(v[7] + v[8]) );
    du[Cp] = (- v[17] + v[18]) + (- v[21] + v[22]) + (- v[33] + v[34]) + (- v[3] +(v[1] + v[2]) );
    du[CpB] = (v[17] - v[18]) + (- v[25] + v[26]) + (- v[6] +(v[4] + v[5]) );
    du[CpM] = (v[21] - v[22]) + (- v[29] + v[30]) + (- v[9] +(v[7] + v[8]) );
    du[CBM] = (v[27] - v[28]) + (v[23] - v[24]) + ( v[31] - v[32]) + ( v[12] -(v[10] + v[11]) );
    du[CpBM] = (v[29] - v[30]) + (v[25] - v[26]) + ( v[33] - v[34]) + ( - v[12] +(v[10] + v[11]) );
    ###################----CBM module----######################

    ###################----TAK1 module---######################
    du[TAK1] =  -(v[35] + v[36] + v[37] + v[38] + v[39] + v[40])  + v[41] - (v[51] + v[52] + v[53]) + v[54];
    du[TAK1p] =  (v[35] + v[36] + v[37] + v[38] + v[39] + v[40]) - v[41] - (v[55] + v[56] + v[57]) + v[58];
    du[TAK1C] = -(v[42] + v[43] + v[44] + v[45] + v[46] + v[47] + v[48] + v[49] ) + v[50] + (v[51] + v[52] + v[53]) - v[54];
    du[TAK1pC] =  (v[42] + v[43] + v[44] + v[45] + v[46] + v[47] + v[48] + v[49] ) - v[50] + (v[55] + v[56] + v[57]) - v[58];
    ###################----TAK1 module---######################

    ###################----IKK module----######################
    du[IKK] =  -(v[59] + v[60] + v[61]) + v[65] + v[81] - (v[67] + v[68] + v[69]) + v[70] + v[82];
    du[IKKC] = -(v[62] + v[63] + v[64]) + v[66] + (v[67] + v[68] + v[69]) - v[70] + v[83];
    du[IKKp] = (v[59] + v[60] + v[61]) - v[65] - (v[71] + v[72] + v[73]) + v[74] - v[82] + u[IKKp]*IKKaNFKBIKB/IKKa;
    du[IKKpC] = (v[71] + v[72] + v[73]) - v[74] - ( v[75] + v[76]) + v[77]+ (v[62] + v[63] + v[64]) - v[66] - v[83] + u[IKKpC]*IKKaNFKBIKB/IKKa;
    du[IKKppC] =  ( v[75] + v[76]) - v[77] - v[78] - v[80] + u[IKKppC]*IKKaNFKBIKB/IKKa;
    du[IKKpp] = v[78] - v[79] + u[IKKpp]*IKKaNFKBIKB/IKKa;
    du[IKKi] = v[79] + v[80] - v[81];
    ###################----IKK module----######################

    ###################----NFkB module----######################
    du[NFKBc] = v[90] + v[91] + v[92] - v[102] + v[103]+ v[104] - v[105] + v[106] - v[110] + v[111] +
                v[112] - v[113] + v[114] - v[118] + v[119] + v[120] - v[121] + v[122] - v[138] + v[139];
    du[NFKBn] = - v[107] + v[108] + v[109] - v[115] + v[116] + v[117] - v[123] + v[124] + v[125] + v[138] - v[139];
    du[IKBac] = - v[93] + v[96] - v[102] + v[103] - v[132] + v[133] + v[143] - v[144];
    du[IKBbc] = - v[94] + v[97] - v[110] + v[111] - v[134] + v[135] + v[148] - v[149];
    du[IKBec] = - v[95] + v[98] - v[118] + v[119] - v[136] + v[137] + v[154] - v[155];
    du[IKBan] = - v[107] + v[108] + v[132] - v[133] - v[145];
    du[IKBbn] = - v[115] + v[116] + v[134] - v[135] - v[150];
    du[IKBen] = - v[123] + v[124] + v[136] - v[137] - v[156];

    du[NFKBIKBac] = - v[84] + v[87] + v[102] - v[103] - v[104] - v[126] + v[127];
    du[NFKBIKBbc] = - v[85] + v[88] + v[110] - v[111] - v[112] - v[128] + v[129];
    du[NFKBIKBec] = - v[86] + v[89] + v[118] - v[119] - v[120] - v[130] + v[131];
    du[NFKBIKBan] = v[107] - v[108] - v[109] + v[126] - v[127];
    du[NFKBIKBbn] = v[115] - v[116] - v[117] + v[128] - v[129];
    du[NFKBIKBen] = v[123] - v[124] - v[125] + v[130] - v[131];
    du[IKKIKBac] = v[93] - v[96] - v[99] - v[105] + v[106];
    du[IKKIKBbc] = v[94] - v[97] - v[100] - v[113] + v[114];
    du[IKKIKBec] = v[95] - v[98] - v[101] - v[121] + v[122];
    du[IKKNFKBIKBac] =  v[84] - v[87] - v[90] + v[105] - v[106];
    du[IKKNFKBIKBbc] =  v[85] - v[88] - v[91] + v[113] - v[114];
    du[IKKNFKBIKBec] =  v[86] - v[89] - v[92] + v[121] - v[122];

    du[mRNAac] = v[140] + v[141] - v[142];
    du[mRNAbc] = v[146] - v[147];
    du[mRNAec] = v[151] + v[152] - v[153];
    du[mRNAa20c] = v[157] + v[158] - v[159];
    du[A20c] = v[160] - v[161];
    ###################----NFkB module----######################
end