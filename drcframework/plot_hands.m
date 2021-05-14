function plot_hands(exp, simdate, simtime)

if (exp == 1)
  folder = ["~/src/rcisneros/hrg/logs/experiments/", simdate, "/"];
else
  folder = "/tmp/";
end

car_comp = ["x", "y", "z"];
rot_comp = {"Rpy", "rPy", "rpY"};

task_space_motion_log = get_structure([folder, "hmc_", simdate, simtime, "-task-space-motion.log"]);
task_space_error_log = get_structure([folder, "hmc_", simdate, simtime, "-task-space-error.log"]);
wrench_space_log = get_structure([folder, "hmc_", simdate, simtime, "-wrench-space.log"]);

t = task_space_motion_log.time;

for i = 1:3
  RHxyz_des(:, i) = task_space_motion_log.(["rhand-des_P", car_comp(i)]);
  RHxyz_hat(:, i) = task_space_motion_log.(["rhand-hat_P", car_comp(i)]);
  RHxyz_err(:, i) = task_space_error_log.(["rhand-err_P", car_comp(i)]);
  RHVxyz_err(:, i) = task_space_error_log.(["rhand-err_V", car_comp(i)]);
  RHWxyz_err(:, i) = task_space_error_log.(["rhand-err_W", car_comp(i)]);
  RH_force_cal(:, i) = wrench_space_log.(["rhand-force-cal_", car_comp(i)]);
  RH_moment_cal(:, i) = wrench_space_log.(["rhand-moment-cal_", car_comp(i)]);
  RH_force_hat(:, i) = wrench_space_log.(["rhand-force-hat_", car_comp(i)]);
  RH_moment_hat(:, i) = wrench_space_log.(["rhand-moment-hat_", car_comp(i)]);
end

for i = 1:3
  RHrpy_des(:, i) = task_space_motion_log.(["rhand-des_R_", rot_comp{i}]);
  RHrpy_hat(:, i) = task_space_motion_log.(["rhand-hat_R_", rot_comp{i}]);
  RHrpy_err(:, i) = task_space_error_log.(["rhand-err_R_", rot_comp{i}]);
end

figure(11)
clf

for j = 1:3

  subplot(3, 2, 2*j - 1)

  title(["RH", car_comp(j), " des vs hat"], 'fontsize', 30);
  hold on;
  grid on;

  plot(t, RHxyz_des(:, j),  'Color', 'magenta', 'LineWidth', 2);
  plot(t, RHxyz_hat(:, j),  'Color', 'red',     'LineWidth', 2);

  h = get(gcf, "currentaxes");
  set(h, "fontsize", 30);
  
  subplot(3, 2, 2*j)

  title(["RH", rot_comp{j}, " des vs hat"], 'fontsize', 30);
  hold on;
  grid on;

  plot(t, RHrpy_des(:, j),  'Color', 'magenta', 'LineWidth', 2);
  plot(t, RHrpy_hat(:, j),  'Color', 'red',     'LineWidth', 2);

  h = get(gcf, "currentaxes");
  set(h, "fontsize", 30);
  
end

figure(12)
clf

for j = 1:3

  subplot(3, 2, 2*j - 1)

  title(["rhand force ", car_comp(j), " cal vs hat"], 'fontsize', 30);
  hold on;
  grid on;
  
  plot(t, RH_force_cal(:, j), 'Color', 'magenta', 'LineWidth', 2);
  plot(t, RH_force_hat(:, j), 'Color', 'black', 'LineWidth', 2);
  
  h = get(gcf, "currentaxes");
  set(h, "fontsize", 30);
  
  subplot(3, 2, 2*j)
  
  title(["rhand moment ", car_comp(j), " cal vs hat"], 'fontsize', 30);
  hold on;
  grid on;
  
  plot(t, RH_moment_cal(:, j), 'Color', 'magenta', 'LineWidth', 2);
  plot(t, RH_moment_hat(:, j), 'Color', 'red', 'LineWidth', 2);

end

figure(13)
clf

for j = 1:3

  subplot(3, 2, 2*j - 1)

  title(["RH", car_comp(j), " err"], 'fontsize', 30);
  hold on;
  grid on;

  plot(t, RHxyz_err(:, j),  'Color', 'black', 'LineWidth', 2);

  h = get(gcf, "currentaxes");
  set(h, "fontsize", 30);
  
  subplot(3, 2, 2*j)

  title(["RH", rot_comp{j}, " err"], 'fontsize', 30);
  hold on;
  grid on;

  plot(t, RHrpy_err(:, j),  'Color', 'black', 'LineWidth', 2);
  
  h = get(gcf, "currentaxes");
  set(h, "fontsize", 30);
  
end

figure(14)
clf

for j = 1:3

  subplot(3, 2, 2*j - 1)

  title(["RH V", car_comp(j), " err"], 'fontsize', 30);
  hold on;
  grid on;

  plot(t, RHVxyz_err(:, j),  'Color', 'black', 'LineWidth', 2);

  h = get(gcf, "currentaxes");
  set(h, "fontsize", 30);
  
  subplot(3, 2, 2*j)

  title(["RH W", car_comp(j), " err"], 'fontsize', 30);
  hold on;
  grid on;

  plot(t, RHWxyz_err(:, j),  'Color', 'black', 'LineWidth', 2);
  
  h = get(gcf, "currentaxes");
  set(h, "fontsize", 30);
  
end