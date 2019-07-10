module Sim
using ..Model;
using DelayDiffEq;

function solvedde(diffeq::Function,u0::Vector{Float64},history::Vector{Float64},tspan,p::Vector{Float64},tau::Float64)
    h(p,t) = history;
    lags = [tau];
    prob = DDEProblem(diffeq,u0,h,tspan,p;constant_lags=lags);
    alg = MethodOfSteps(BS3());
    sol = solve(prob,alg);
    return sol
end

function getSS(p::Vector{Float64},u0::Vector{Float64},sstime::Float64,tau::Float64)
    #get steady state (t<0)
    param::Vector{Float64} = copy(p);
    param[C.term] = 1.0;
    history::Vector{Float64} = u0;
    tspan::Tuple{Float64,Float64} = (0.0,sstime);
    sol = solvedde(diffeq,u0,history,tspan,param,tau);

    return sol[:,end]
end

function getTC(p::Vector{Float64},u0::Vector{Float64},sstime::Float64,simtime::Float64,tau::Float64)
    param::Vector{Float64} = copy(p);
    param[C.term] = 0.0;
    u1::Vector{Float64} = getSS(p,u0,sstime,tau);
    history::Vector{Float64} = u1;
    tspan::Tuple{Float64,Float64} = (0.0,simtime);
    sol = solvedde(diffeq,u1,history,tspan,param,tau);

    return sol
end


const sstime = 1000.0;
const simtime = 360.0;



p = f_params();
u0 = initialValues();

sol = getTC(p,u0,sstime,simtime,p[C.delayrnae]);

const t = sol.t;

CBMa = sol[V.Cp,:] + sol[V.CpB,:] + sol[V.CpM,:] + sol[V.CpBM,:];
TAK1a = sol[V.TAK1p,:] + sol[V.TAK1pC,:];
IKKa = sol[V.IKKp,:] + sol[V.IKKpC,:] + sol[V.IKKppC,:] + sol[V.IKKpp,:];
NFkBa = sol[V.NFKBn,:];

end  # module