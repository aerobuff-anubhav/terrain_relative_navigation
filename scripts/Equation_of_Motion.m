% currently only available for position
function [states] = Equation_of_Motion(u, F, M, agent_parameters, t, del_t)
    ap = agent_parameters;
    a = F/ap.m;
    v = u(7:9) + a*del_t;
    pos = u(1:3) + v*del_t;
    ea = [0;0;0];
    om = [0;0;0];
    states = [pos; ea; v; om; t+del_t];
end
