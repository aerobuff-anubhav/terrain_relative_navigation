% defines flight conditions and atmospheric parameters
% citation - ttwistor. ("Mission Performance of the Tempest UAS in Supercell Storms")

agent_parameters.g = 9.81; %[m/s^2]
agent_parameters.m = 2; %[kg]
agent_parameters.W = agent_parameters.m*agent_parameters.g; %[N]

% control surface deflection parameters to be included later
agent_parameters.ax = 0.1; %[m/s^2]
