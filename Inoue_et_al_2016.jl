module Inoue_et_al_2016
using PyPlot;

export runSim

include("model/model.jl");
using .Model;

include("simulation.jl");
using .Sim;

include("plotFunc.jl");

function runSim()
    plotFunc_timecourse(Sim);
end

end  # module