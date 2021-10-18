function drawAgent(uu, pts)
    px = uu(1);
    py = uu(2);
    pz = uu(3);
    t = uu(4);
    
    % define persistent variables
    persistent agent_handle1;       % for flying agent
    persistent agent_handle2;       % for fov
    persistent terrain_handle1;
    persistent terrain_handle2;
    persistent terrain_handle3;
    
    persistent scale_plot;
    persistent axis_vec;
    
    if t<0.1
        tlim = 1;
%         speed = sqrt(px*px + py*py + pz*pz);
%         plim = speed*tlim;
        plim = tlim;
        scale_plot = plim;
        xmin = 0;%px - plim*20;
        xmax = 0 + plim*20;
        ymin = 0;%py - plim*20;
        ymax = 0 + plim*20;
% %         zmin = pz - plim/2;
% %         zmax = pz + plim/2;
%         ymin = -10;
%         ymax = 10;
        zmin = 0;
        zmax = 10;
        axis_vec = [xmin, xmax, ymin, ymax, zmin, zmax];

        figure(1), clf
        box on;
        agent_handle1 = drawAgentBody(pts.quad, px,py,pz, 'r', scale_plot, []);
        agent_handle2 = drawAgentBody(pts.fov, px,py,pz, 'black', scale_plot, []);
        terrain_handle1 = drawTerrain(pts.terrain1, scale_plot, []);
        terrain_handle2 = drawTerrain(pts.terrain2, scale_plot, []);
        terrain_handle3 = drawTerrain(pts.terrain3, scale_plot, []);
        
        title ('Terrain Relative Navigation')
        xlabel('X');
        ylabel('Y');
        zlabel('Z');
        view(0,90);
%         view(32,10);
        axis(axis_vec);
        grid on;
        hold on;
    else
        drawAgentBody(pts.quad, px,py,pz, scale_plot, agent_handle2);
        drawAgentBody(pts.fov, px,py,pz, scale_plot, agent_handle1);
        drawTerrain(pts.terrain1, scale_plot, terrain_handle1);
        drawTerrain(pts.terrain2, scale_plot, terrain_handle2);
        drawTerrain(pts.terrain3, scale_plot, terrain_handle3);
        
        [flag, axis_new] = in_view(axis_vec,px,py,pz);
        if (flag)
            figure(1);
            axis_vec = axis_new;
            axis(axis_vec);
        end
    end
   
end

function handle = drawAgentBody(XYZ, px,py,pz, color,scale_plot, handle)
    SCALE = scale_plot;
%         SCALE = 1;

    XYZ = translate(XYZ,px,py,pz); % translate agent
    XYZ = SCALE*XYZ;
    
    % plot aircraft
  if isempty(handle)
    handle = animatedline(XYZ(1,:),XYZ(2,:),XYZ(3,:), 'Color', color,'DisplayName','True');
    hold on;
  else
    clearpoints(handle)
    addpoints(handle,XYZ(1,:),XYZ(2,:),XYZ(3,:), 'Color', color,'DisplayName','True');
    drawnow
  end

%     if isempty(handle)
%         handle = plot3(XYZ(1,:),XYZ(2,:),XYZ(3,:),'ko-', 'LineWidth' ,2 , 'MarkerFaceColor', 'g');
%         hold on;
%     else
%         set(handle, 'XData', XYZ(1,:),'YData',XYZ(2,:),'ZData',XYZ(3,:));
%         drawnow
%     end
end

function handle = drawTerrain(XYZ, scale_plot, handle)
    SCALE = scale_plot;
    XYZ = SCALE*XYZ;
    if isempty(handle)
        handle = plot3(XYZ(1),XYZ(2),XYZ(3),  '*');
        hold on;
    else
        set(handle, 'XData', XYZ(1),'YData',XYZ(2),'ZData',XYZ(3), '*');
    end
end

function XYZ = translate(XYZ,px,py,pz)
    XYZ = XYZ + [px; py; pz];
%     XYZ = XYZ + repmat([px;py;pz],1,size(XYZ,2));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% determines if aircraft is in current set of axis, and if not determines
% new axis
function [flag, axis_new] = in_view(axis_vec,pn,pe,pd)
    xp = pe;
    yp = pn;
    zp = pd;
    
    flag = 0;
    axis_new = axis_vec;
    
    if (xp<axis_vec(1))
        flag = 1;
        dx = axis_vec(2) - axis_vec(1);
        axis_new(1:2) = axis_vec(1:2)-[dx dx];
    elseif(xp>axis_vec(2))
        flag = 2;
        dx = axis_vec(2) - axis_vec(1);
        axis_new(1:2) = axis_vec(1:2)+[dx dx];
    end

    if (yp<axis_vec(3))
        flag = 3;
        dy = axis_vec(4) - axis_vec(3);
        axis_new(3:4) = axis_vec(3:4)-[dy dy];
    elseif(yp>axis_vec(4))
        flag = 4;
        dy = axis_vec(4) - axis_vec(3);
        axis_new(3:4) = axis_vec(3:4)+[dy dy];
    end
        
    if (zp<axis_vec(5))
        flag = 5;
        dz = axis_vec(6) - axis_vec(5);
        axis_new(5:6) = axis_vec(5:6)-[dz dz];
    elseif(zp>axis_vec(6))
        flag = 6;
        dz = axis_vec(6) - axis_vec(5);
        axis_new(5:6) = axis_vec(5:6)+[dz dz];
    end
end
