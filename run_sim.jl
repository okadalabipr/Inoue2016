#---
include("simulation.jl");
sol = runSimulation();

include("plot_func.jl");
savefig("./NFkBmodel.png",bbox_inches="tight");
