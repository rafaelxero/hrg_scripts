function plot_stabilizer(simdate, simtime)

%folder = ["~/src/rcisneros/hrg/logs/experiments/", simdate, "/"];
folder = "/tmp/";

car_comp = ["x", "y", "z"];

stabilizer_log = get_structure([folder, "hmc_", simdate, simtime, "-stabilizer.log"]);

t = stabilizer_log.time;

for i = 1:3

  com_des(:, i) = stabilizer_log.(["com-des_", car_comp(i)]);
  ddcom_des(:, i) = stabilizer_log.(["ddcom-des_", car_comp(i)]);
  com_hat(:, i) = stabilizer_log.(["com-hat_P", car_comp(i)]);
  zmp_des(:, i) = stabilizer_log.(["zmp-des_", car_comp(i)]);
  zmp_mod(:, i) = stabilizer_log.(["zmp-mod_", car_comp(i)]);
  zmp_ideal(:, i) = stabilizer_log.(["zmp-ideal_", car_comp(i)]);
  zmp_repcmp(:, i) = stabilizer_log.(["zmp-repcmp_", car_comp(i)]);
  zmp_ref(:, i) = stabilizer_log.(["zmp-ref_", car_comp(i)]);
  zmp_cal(:, i) = stabilizer_log.(["zmp-cal_", car_comp(i)]);
  zmp_err(:, i) = stabilizer_log.(["zmp-err_", car_comp(i)]);
  zmp_ctrlerr(:, i) = stabilizer_log.(["zmp-ctrlerr_", car_comp(i)]);
  zmp_planerr(:, i) = stabilizer_log.(["zmp-planerr_", car_comp(i)]);
  moment_ctrlerr(:, i) = stabilizer_log.(["moment-ctrlerr_", car_comp(i)]);
  com_est(:, i) = stabilizer_log.(["com-est_", car_comp(i)]);
  zmp_est(:, i) = stabilizer_log.(["zmp-est_", car_comp(i)]);
  com_balerr(:, i) = stabilizer_log.(["com-balerr_", car_comp(i)]);
  zmp_balerr(:, i) = stabilizer_log.(["zmp-balerr_", car_comp(i)]);
  cp_err(:, i) = stabilizer_log.(["cp-err_", car_comp(i)]);
  icp(:, i) = stabilizer_log.(["icp_", car_comp(i)]);
  
end

omega = stabilizer_log.omega;

figure(1)
clf

for j = 1:3

  subplot(3, 1, j);

  title(["com", car_comp(j), " des vs hat vs est"], 'fontsize', 30)
    
  hold on;
  grid on;

  plot(t, com_des(:, j), 'Color', 'magenta', 'LineWidth', 2);
  plot(t, com_hat(:, j), 'Color', 'green',   'LineWidth', 2);
  plot(t, com_est(:, j), 'Color', 'red',     'LineWidth', 2);

end

figure(2)
clf

for j = 1:3

  subplot(3, 1, j);

  title(["ddcom", car_comp(j), " des"], 'fontsize', 30)
    
  hold on;
  grid on;

  plot(t, ddcom_des(:, j), 'Color', 'magenta', 'LineWidth', 2);

end

figure(3)
clf

for j = 1:3

  subplot(3, 1, j);

  title(["zmp", car_comp(j), " des vs mod vs ref vs cal vs hat"], 'fontsize', 30)
    
  hold on;
  grid on;

  plot(t, zmp_des(:, j), 'Color', 'magenta', 'LineWidth', 2);
  plot(t, zmp_mod(:, j), 'Color', 'green',   'LineWidth', 2);
  plot(t, zmp_ref(:, j), 'Color', 'blue',    'LineWidth', 2);
  plot(t, zmp_cal(:, j), 'Color', 'black',   'LineWidth', 2);
  plot(t, zmp_est(:, j), 'Color', 'red',     'LineWidth', 2);

end

figure(4)
clf

for j = 1:3

  subplot(3, 1, j);

  title(["com ", car_comp(j) , " balerr vs cp", car_comp(j), " err"], 'fontsize', 30)
    
  hold on;
  grid on;

  plot(t, com_balerr(:, j), 'Color', 'magenta', 'LineWidth', 2);
  plot(t, cp_err(:, j), 'Color', 'green', 'LineWidth', 2);

end

figure(5)
clf

for j = 1:3

  subplot(3, 1, j);

  title(["zmp", car_comp(j), " err vs balerr"], 'fontsize', 30)
    
  hold on;
  grid on;

  plot(t, zmp_err(:, j), 'Color', 'red', 'LineWidth', 2);
  plot(t, zmp_balerr(:, j), 'Color', 'magenta', 'LineWidth', 2);

end

figure(6)
clf

for j = 1:3

  subplot(3, 1, j);

  title(["zmp", car_comp(j), " ideal vs repcmp"], 'fontsize', 30)
    
  hold on;
  grid on;

  plot(t, zmp_ideal(:, j), 'Color', 'red', 'LineWidth', 2);
  plot(t, zmp_repcmp(:, j), 'Color', 'magenta', 'LineWidth', 2);

end

figure(7)
clf

for j = 1:3

  subplot(3, 1, j);

  title(["zmp", car_comp(j), " ctrlerr vs planerr"], 'fontsize', 30)
    
  hold on;
  grid on;

  plot(t, zmp_ctrlerr(:, j), 'Color', 'magenta', 'LineWidth', 2);
  plot(t, zmp_planerr(:, j), 'Color', 'red', 'LineWidth', 2);

end

figure(8)
clf

for j = 1:3

  subplot(3, 1, j);

  title(["moment", car_comp(j), " ctrlerr"], 'fontsize', 30)
    
  hold on;
  grid on;

  plot(t, moment_ctrlerr(:, j), 'Color', 'magenta', 'LineWidth', 2);

end