% Defines vertices V needed for animation function drawAgent
%
% The drawAgent function expects the aircraft to be defined by a
% structure with four elements describing the fuselage (pts.fuse), the wing
% (pts.wing), the horizontal tail (pts.tailwing), and the vertical tail
% (pts.tail). Each element is a vector of points that describe a closed
% polygon shape.

% Declaring vertices of the agent. The fov is defined with respect to the
% quad/agent. If done reverse, the initial position will be of the fov and
% not of the quad/agent.

len = 2;
wid = 1;

% [x y z]
V_quad = [...
    -0.25   0   0;...   % point 5
    0.25   0   0;...   % point 6
    0   -0.25   0;...   % point 7
    0   0.25   0;...   % point 8
    0   0   0;...   % point 9, midpoint
    ];

% [x y z]
V_fov = [...
    V_quad(5,1)-len/2    V_quad(5,2)-wid/2     V_quad(5,3);...   % point 1
    V_quad(5,1)+len/2    V_quad(5,2)-wid/2    V_quad(5,3);...   % point 2
    V_quad(5,1)+len/2    V_quad(5,2)+wid/2     V_quad(5,3);...   % point 3
    V_quad(5,1)-len/2    V_quad(5,2)+wid/2     V_quad(5,3);...   % point 4
    ];

% [x y z ID]
V_terrain_db = [...
    6.5    6    0   1;...   % point 1
    5.5    9    0   2;...   % point 2
    5.5    6    0   3;...   % point 3
    ];

pts.quad = [...
	V_quad(1,:);...
    V_quad(2,:);...
    V_quad(5,:);...
    V_quad(3,:);...
    V_quad(4,:);...
    ]';

pts.fov = [...
	V_fov(1,:);...
	V_fov(2,:);...
	V_fov(3,:);...
	V_fov(4,:);...
    V_fov(1,:)]';

pts.terrain1 = V_terrain_db(1,:);
pts.terrain2 = V_terrain_db(2,:);
pts.terrain3 = V_terrain_db(3,:);
