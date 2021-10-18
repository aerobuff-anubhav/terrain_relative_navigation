function [state_vector] = S_Dynamics(u, agent_parameters)
    agent_states = u;
    [forces, moments] = Dynamics(agent_states, agent_parameters);
    state_vector = [forces; moments];
% display(u);
%     px = u(1)+1;
%     py = u(2);
%     pz = u(3);
%     state_vector = [px py pz];
end
