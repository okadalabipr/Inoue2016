function plotFunc_timecourse(Sim::Module)
    rc("figure",figsize = (12,8));
    rc("font",size = 18);
    rc("axes",linewidth = 1);
    rc("lines",linewidth = 2);

    subplots_adjust(wspace=0.5, hspace=0.5);

    subplot(2,2,1);
    plot(Sim.t,Sim.CBMa./maximum(Sim.CBMa).*100,"k");
    xlim(-0.5,9.5);
    xticks([0,3,6,9]);
    ylim(0,120);
    yticks([0,20,40,60,80,100]);
    xlabel("Time (min)");
    ylabel("CP668 activity \n (relative % max.)");

    subplot(2,2,2);
    plot(Sim.t,Sim.TAK1a./maximum(Sim.TAK1a).*100,"k");
    xlim(-0.5,9.5);
    xticks([0,3,6,9]);
    ylim(0,120);
    yticks([0,20,40,60,80,100]);
    xlabel("Time (min)");
    ylabel("TAK1 activity \n (relative % max.)");

    subplot(2,2,3);
    plot(Sim.t,Sim.IKKa./maximum(Sim.IKKa).*100,"k");
    xlim(-0.5,9.5);
    xticks([0,3,6,9]);
    ylim(0,120);
    yticks([0,20,40,60,80,100]);
    xlabel("Time (min)");
    ylabel("IKK activity \n (relative % max.)");

    subplot(2,2,4);
    plot(Sim.t,Sim.NFkBa./maximum(Sim.NFkBa).*100,"k");
    xlim(0,360);
    xticks([0,120,240,360]);
    ylim(0,120);
    yticks([0,20,40,60,80,100]);
    xlabel("Time (min)");
    ylabel("NFκB activity \n (relative % max.)");

    show();
end
