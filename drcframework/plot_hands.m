function plot_hands(exp, simdate, simtime)

if (exp == 1)
  folder = ["~/src/rcisneros/hrg/logs/experiments/", simdate, "/"];
else
  folder = "/tmp/";
end

car_comp = ["x", "y", "z"];
rot_comp = {"Rpy", "rPy", "rpY"};

task_space_motion_log = get_structure([folder, "hmc_", simdate, simtime, "-task-space-motion.log"]);

t = task_space_motion_log.time;

for i = 1:3
  RHxyz_des(:, i) = task_space_motion_log.(["rhand-des_P", car_comp(i)]);
  RHxyz_hat(:, i) = task_space_motion_log.(["rhand-hat_P", car_comp(i)]);
end

for i = 1:3
  RHrpy_des(:, i) = task_space_motion_log.(["rhand-des_R_", rot_comp{i}]);
  RHrpy_hat(:, i) = task_space_motion_log.(["rhand-hat_R_", rot_comp{i}]);
end

figure(1)
clf

for j = 1:3

  subplot(3, 2, 2*j - 1)

  title(["RH", car_comp(j), " des vs hat"], 'fontsize', 30)
  hold on;
  grid on;

  plot(t, RHxyz_des(:, j),  'Color', 'magenta', 'LineWidth', 2);
  plot(t, RHxyz_hat(:, j),  'Color', 'red',     'LineWidth', 2);

  h = get(gcf, "currentaxes");
  set(h, "fontsize", 30);
  
  subplot(3, 2, 2*j)

  title(["RH", rot_comp{j}, " des vs hat"], 'fontsize', 30)
  hold on;
  grid on;

  plot(t, RHrpy_des(:, j),  'Color', 'magenta', 'LineWidth', 2);
  plot(t, RHrpy_hat(:, j),  'Color', 'red',     'LineWidth', 2);

  h = get(gcf, "currentaxes");
  set(h, "fontsize", 30);
  
end