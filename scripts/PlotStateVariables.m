function PlotStateVariables(uu)
    px = uu(1);
    py = uu(2);
    pz = uu(3);
    t = uu(4);
    
    persistent px_handle
%     persistent py_handle
%     persistent pz_handle
    
    if t==0
        figure(2), clf
        hold on;
        px_handle = graph_y(t, px, 'p_x', []);
    else
        graph_y(t, px, 'p_x', px_handle);
    end

end

function handle = graph_y(t, y, lab, handle)
    if isempty(handle)
        handle = plot(t,y);
    else
        set(handle, 'XData', [get(handle, 'XData'), t])
        set(handle, 'YData', [get(handle, 'XData'), y])
    end
end
