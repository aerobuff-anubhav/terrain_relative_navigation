close all;
clear all;
clc;

% define the geometry of the agent being displayed
DefineAgent;
DRAW_FLAG = 1;

% define some physical and aerodynamic parameters
agent;

% set initial flight conditions
position_inertial = [6 1 10];
euler_angles = [0 0 0];
velocity_inertial = [0 1 0];
omega_inertial = [0 0 0];

% run the simulation
tfinal = 10;
% sim('agent_simulation_R2020a', tfinal)
%
t = 0;
u = [position_inertial euler_angles velocity_inertial omega_inertial t]';
del_t = 0.05;

while t<tfinal
    
    drawAgent(u, pts)
    
% state propagation
	terrainBO = detection(u, V_terrain_db);
    [state_vector] = S_Dynamics(u, agent_parameters);
    F = state_vector(1:3);
    M = state_vector(4:6);
    u = Equation_of_Motion(u, F, M, agent_parameters, t, del_t);
    
    if terrainBO.trigger == 1
        for i=1:length(terrainBO.ID)
            id = terrainBO.ID(i);
            in_fov = terrainBO.in_fov;
            xyz_terrain = V_terrain_db(id,1:3);
            x_quadFrame = xyz_terrain(1) - u(1);
            y_quadFrame = xyz_terrain(2) - u(2);
            z_quadFrame = xyz_terrain(3) - u(3);
            phi = atan2(y_quadFrame, x_quadFrame);
            theta = atan2(z_quadFrame, y_quadFrame);
            fprintf("ID = %d, in_fov= %d, Ele = %.2f, Azi = %.2f, time= %.2f\n", id, in_fov, rad2deg(theta), rad2deg(phi), t);
        end
    end
    
    t = t + del_t;
end
%}
%
u(8) = -1;
while t<2*tfinal
    
    drawAgent(u, pts)
    
% state propagation
    terrainBO = detection(u, V_terrain_db);
    [state_vector] = S_Dynamics(u, agent_parameters);
    F = state_vector(1:3);
    M = state_vector(4:6);
    u = Equation_of_Motion(u, F, M, agent_parameters, t, del_t);
    
    if terrainBO.trigger == 1
        for i=1:length(terrainBO.ID)
            id = terrainBO.ID(i);
            xyz_terrain = V_terrain_db(id,1:3);
            x_quadFrame = xyz_terrain(1) - u(1);
            y_quadFrame = xyz_terrain(2) - u(2);
            z_quadFrame = xyz_terrain(3) - u(3);
            phi = atan2(y_quadFrame, x_quadFrame);
            theta = atan2(z_quadFrame, y_quadFrame);
%             phi = atan2(xyz_terrain(2),xyz_terrain(1));
%             theta = atan2(xyz_terrain(3),xyz_terrain(2));
            fprintf("ID = %d, in_fov= %d, Ele = %.2f, Azi = %.2f, time= %.2f\n", id, in_fov, rad2deg(theta), rad2deg(phi), t);
        end
    end

    t = t + del_t;
end
%}
