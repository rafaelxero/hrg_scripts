function plot_COM(simdate, simtime)

folder = "/tmp/";

car_comp = ["x", "y", "z"];
rot_comp = {"Rpy", "rPy", "rpY"};

task_space_motion_log = get_structure([folder, "hmc_", simdate, simtime, "-task-space-motion.log"]);

t = task_space_motion_log.time;

for i = 1:3

  comxyz_des(:, i) = task_space_motion_log.(["com-des1_P", car_comp(i)]);
  comxyz_hat(:, i) = task_space_motion_log.(["com-hat1_P", car_comp(i)]);

%  dcomxyz_des(:, i) = task_space_motion_log.(["com-des1_V", car_comp(i)]);
%  dcomxyz_hat(:, i) = task_space_motion_log.(["com-hat1_V", car_comp(i)]);
%  
%  ddcomxyz_des(:, i) = task_space_motion_log.(["com-des1_Vdot", car_comp(i)]);

end

figure(1)
clf

for j = 1:3

  subplot(3, 1, j)

  title(["COM", car_comp(j), " des vs hat"], 'fontsize', 30)
  
  hold on;
  grid on;

  plot(t, comxyz_des(:, j),   'Color', 'magenta', 'LineWidth', 2);
  plot(t, comxyz_hat(:, j),   'Color', 'red',     'LineWidth', 2);
    
  h = get(gcf, "currentaxes");
  set(h, "fontsize", 30);
  
end

%figure(2)
%clf
%
%for j = 1:3
%
%  subplot(3, 1, j)
%
%  title(["dCOM", car_comp(j), " des vs hat"], 'fontsize', 30)
%  
%  hold on;
%  grid on;
%
%  plot(t, dcomxyz_des(:, j),   'Color', 'magenta', 'LineWidth', 2);
%  plot(t, dcomxyz_hat(:, j),   'Color', 'red',     'LineWidth', 2);
%    
%  h = get(gcf, "currentaxes");
%  set(h, "fontsize", 30);
%  
%end
%
%figure(3)
%clf
%
%for j = 1:3
%
%  subplot(3, 1, j)
%
%  title(["ddCOM", car_comp(j), " des vs hat"], 'fontsize', 30)
%  
%  hold on;
%  grid on;
%
%  plot(t, ddcomxyz_des(:, j),   'Color', 'magenta', 'LineWidth', 2);
%    
%  h = get(gcf, "currentaxes");
%  set(h, "fontsize", 30);
%  
%end