const variable = [
  "B"# y(1);
  "M"# y(2);
  "BM"# y(3);
  "C"# y(4);
  "CB"# y(5);
  "CM"# y(6);
  "Cp"# y(7);
  "CpB"# y(8);
  "CpM"# y(9);
  "CBM"# y(10);
  "CpBM"# y(11);
  #(* "TAK1 module*)
  "TAK1"# y(12);
  "TAK1p"# y(13);
  "TAK1C"# y(14);
  "TAK1pC"# y(15);
  #(* "IKK module*)
  "IKK"# y(16);
  "IKKC"# y(17);
  "IKKp"# y(18);
  "IKKpC"# y(19);
  "IKKppC"# y(20);
  "IKKpp"# y(21);
  "IKKi"# y(22);
  #(* NFkB module*) c:cytoplasm n:nucleos
  "NFKBc"# y(23);
  "NFKBn"# y(24);
  "IKBac"# y(25);
  "IKBbc"# y(26);
  "IKBec"# y(27);
  "IKBan"# y(28);
  "IKBbn"# y(29);
  "IKBen"# y(30);
  "NFKBIKBac"# y(31);
  "NFKBIKBbc"# y(32);
  "NFKBIKBec"# y(33);
  "NFKBIKBan"# y(34);
  "NFKBIKBbn"# y(35);
  "NFKBIKBen"# y(36);
  "IKKIKBac"# y(37);
  "IKKIKBbc"# y(38);
  "IKKIKBec"# y(39);
  "IKKNFKBIKBac"# y(40);
  "IKKNFKBIKBbc"# y(41);
  "IKKNFKBIKBec"# y(42);
  "mRNAac"# y(43);
  "mRNAbc"# y(44);
  "mRNAec"# y(45);
  "mRNAa20c"# y(46);
  "A20c"# y(47);
];

for (index,value) in enumerate(variable)
  eval(Meta.parse("const $value=$index"));
end