function plot_feet(simdate, simtime)

folder = "/tmp/";

car_comp = ["x", "y", "z"];
rot_comp = {"Rpy", "rPy", "rpY"};

task_space_motion_log = get_structure([folder, "hmc_", simdate, simtime, "-task-space-motion.log"]);

t = task_space_motion_log.time;

for i = 1:3
  RFxyz_des(:, i) = task_space_motion_log.(["rfoot-des_P", car_comp(i)]);
  RFxyz_hat(:, i) = task_space_motion_log.(["rfoot-hat_P", car_comp(i)]);
end

for i = 1:3
  RFrpy_des(:, i) = task_space_motion_log.(["rfoot-des_R_", rot_comp{i}]);
  RFrpy_hat(:, i) = task_space_motion_log.(["rfoot-hat_R_", rot_comp{i}]);
end

figure(1)
clf

for j = 1:3

  subplot(3, 2, 2*j - 1)

  title(["RF", car_comp(j), " des vs hat"], 'fontsize', 30)
  hold on;
  grid on;

  plot(t, RFxyz_des(:, j),  'Color', 'magenta', 'LineWidth', 2);
  plot(t, RFxyz_hat(:, j),  'Color', 'red',     'LineWidth', 2);

  h = get(gcf, "currentaxes");
  set(h, "fontsize", 30);
  
  subplot(3, 2, 2*j)

  title(["RF", rot_comp{j}, " des vs hat"], 'fontsize', 30)
  hold on;
  grid on;

  plot(t, RFrpy_des(:, j),  'Color', 'magenta', 'LineWidth', 2);
  plot(t, RFrpy_hat(:, j),  'Color', 'red',     'LineWidth', 2);

  h = get(gcf, "currentaxes");
  set(h, "fontsize", 30);
  
end