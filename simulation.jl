using Printf;
using DelayDiffEq;

include("model/f_parameter.jl");
include("model/f_variable.jl");
include("model/differential_equation.jl");
include("model/initial_condition.jl");

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
    param[term] = 1.0;
    history::Vector{Float64} = u0;
    tspan::Tuple{Float64,Float64} = (0.0,sstime);
    sol = solvedde(diffeq,u0,history,tspan,param,tau);

    return sol[:,end]
end

function getTC(p::Vector{Float64},u0::Vector{Float64},sstime::Float64,simtime::Float64,tau::Float64)
    param::Vector{Float64} = copy(p);
    param[term] = 0.0;
    u1::Vector{Float64} = getSS(p,u0,sstime,tau);
    history::Vector{Float64} = u1;
    tspan::Tuple{Float64,Float64} = (0.0,simtime);
    sol = solvedde(diffeq,u1,history,tspan,param,tau);

    return sol
end

function runSimulation()
    sstime::Float64 = 1000.0;
    simtime::Float64 = 360.0;

    p::Vector{Float64} = f_params();
    u0::Vector{Float64} = initial_values();

    return getTC(p,u0,sstime,simtime,p[delayrnae]);
end