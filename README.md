# Inoue_et_al_2016
Inoue, K. *et al.* Oscillation dynamics underlie functional switching of NF-κB for B-cell activation. *npj Syst. Biol. Appl.* **2**, 16024 (2016). https://doi.org/10.1038/npjsba.2016.24

## Requirements
- **[Julia 1.0+](https://julialang.org)**
  - [DelayDiffEq](https://github.com/JuliaDiffEq/DelayDiffEq.jl)
  - [PyPlot](https://github.com/JuliaPy/PyPlot.jl)
- **[Juno](http://junolab.org)**

## Run Simulation and View Results
```julia
include("simulation.jl");
include("plot_func.jl");
savefig("./NFkBmodel.png",bbox_inches="tight");
```

## Installation

    $ git clone https://github.com/okadalabipr/Inoue_et_al_2016.git
