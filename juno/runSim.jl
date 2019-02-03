#---
include("../simulation.jl");
sol = runSimulation();

include("../plotFunc.jl");
savefig("./NFkBmodel.png",bbox_inches="tight");