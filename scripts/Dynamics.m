function [forces, moments] = Dynamics(agent_states, agent_parameters)
    ap = agent_parameters;
    as = agent_states;
    
% propulsive forces and moments
    fp = [0 0 0]';
    Gp = [0 0 0]';
    
% setting other variables zero for now    
    fa = [0 0 0]';
    fg = [0 0 0]';
% total forces and moments
    forces = [fa + fp + fg];
    moments = Gp;
end
