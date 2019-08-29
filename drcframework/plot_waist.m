function plot_waist(simdate, simtime)

folder = "/tmp/";

car_comp = ["x", "y", "z"];
rot_comp = {"Rpy", "rPy", "rpY"};

task_space_motion_log = get_structure([folder, "hmc_", simdate, simtime, "-task-space-motion.log"]);

t = task_space_motion_log.time;

for i = 1:3
  Bxyz_des(:, i) = task_space_motion_log.(["body-des_P", car_comp(i)]);
  Bxyz_hat(:, i) = task_space_motion_log.(["body-hat_P", car_comp(i)]);
end

for i = 1:3
  Brpy_des(:, i) = task_space_motion_log.(["body-des_R_", rot_comp{i}]);
  Brpy_hat(:, i) = task_space_motion_log.(["body-hat_R_", rot_comp{i}]);
end

figure(1)
clf

for j = 1:3

  subplot(3, 2, 2*j - 1)

  title(["B", car_comp(j), " des vs hat"], 'fontsize', 30)
  hold on;
  grid on;

  plot(t, Bxyz_des(:, j),  'Color', 'magenta',   'LineWidth', 2);
  plot(t, Bxyz_hat(:, j),  'Color', 'red', 'LineWidth', 2);

  h = get(gcf, "currentaxes");
  set(h, "fontsize", 30);
  
  subplot(3, 2, 2*j)

  title(["B", rot_comp{j}, " des vs hat"], 'fontsize', 30)
  hold on;
  grid on;

  plot(t, Brpy_des(:, j),  'Color', 'magenta',   'LineWidth', 2);
  plot(t, Brpy_hat(:, j),  'Color', 'red', 'LineWidth', 2);

  h = get(gcf, "currentaxes");
  set(h, "fontsize", 30);
  
end