function [terrainBO] = detection(u, V_terrain_db)
    px = u(1);
    py = u(2);
    pz = u(3);
    
%     persistent x_feature;
%     persistent y_feature;
    
    X_fov_min = px - 1; % relative position of xmin
    X_fov_max = px + 1; % relative position of xmax
    Y_fov_min = py - 0.5; % relative position of ymin
    Y_fov_max = py + 0.5; % relative position of ymax
    Z_fov_min = -pz; % relative position of zmin
    Z_fov_max = pz; % relative position of zmax

    X_terrain = V_terrain_db(:,1);
    Y_terrain = V_terrain_db(:,2);
    Z_terrain = V_terrain_db(:,3);
    ID_terrain = V_terrain_db(:,4);
    trigger = 0;
    in_fov = 0;
    j = 0;
    ID_array = [];%zeros(length(V_terrain_db(:,1)),1);
    for i=1:length(V_terrain_db(:,1))
        if(X_terrain(i) > X_fov_min && X_terrain(i) < X_fov_max && ...
                Y_terrain(i) > Y_fov_min && Y_terrain(i) < Y_fov_max && ...
                Z_terrain(i) > Z_fov_min && Z_terrain(i) < Z_fov_max ...
                )
            trigger = 1;
            in_fov = in_fov + 1;
            j = j+1;
            ID_array(j) = ID_terrain(i);
        end
    end
    terrainBO.ID = ID_array;
    terrainBO.in_fov = in_fov;
    terrainBO.trigger = trigger;
end
