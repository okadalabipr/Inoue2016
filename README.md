# Inoue_et_al_2016
Inoue, K. *et al.* Oscillation dynamics underlie functional switching of NF-κB for B-cell activation. *npj Syst. Biol. Appl.* **2**, 16024 (2016). https://doi.org/10.1038/npjsba.2016.24

## Requirements
- **[Julia 1.0+](https://julialang.org)**
    - [DelayDiffEq](https://github.com/JuliaDiffEq/DelayDiffEq.jl)
    - [PyPlot](https://github.com/JuliaPy/PyPlot.jl)
    - [IJulia](https://github.com/JuliaLang/IJulia.jl)

## Run Simulation and View Results
```julia
include("Inoue2016.jl")
using .Inoue2016
runSim()
```
![NFkBmodel](https://user-images.githubusercontent.com/31299606/60936877-9f0d6880-a309-11e9-8067-a7acaaccd694.png)

## Installation
    $ git clone https://github.com/okadalabipr/Inoue2016.git

## License
[MIT](/LICENSE)