function plot_stabilizer(simdate, simtime)

%folder = ["~/src/rcisneros/hrg/logs/experiments/", simdate, "/"];
folder = "/tmp/";

car_comp = ["x", "y", "z"];

stabilizer_log = get_structure([folder, "hmc_", simdate, simtime, "-stabilizer.log"]);

t = stabilizer_log.time;

for i = 1:3

  com_des(:, i) = stabilizer_log.(["com-des_", car_comp(i)]);
  ddcom_des(:, i) = stabilizer_log.(["ddcom-des_", car_comp(i)]);
  com_hat1(:, i) = stabilizer_log.(["com-hat1_P", car_comp(i)]);
  zmp_des(:, i) = stabilizer_log.(["zmp-des_", car_comp(i)]);
  zmp_mod(:, i) = stabilizer_log.(["zmp-mod_", car_comp(i)]);
  zmp_ref(:, i) = stabilizer_log.(["zmp-ref_", car_comp(i)]);
  zmp_cal(:, i) = stabilizer_log.(["zmp-cal_", car_comp(i)]);
  zmp_hat(:, i) = stabilizer_log.(["zmp-hat_", car_comp(i)]);
  zmp_err_refcal(:, i) = stabilizer_log.(["zmp-err1_", car_comp(i)]);
  zmp_err_refhat(:, i) = stabilizer_log.(["zmp-err2_", car_comp(i)]);
  moment_err(:, i) = stabilizer_log.(["moment-err_", car_comp(i)]);
  com_hat2(:, i) = stabilizer_log.(["com-hat2_", car_comp(i)]);
  com_err(:, i) = stabilizer_log.(["com-err_", car_comp(i)]);
  cp_err(:, i) = stabilizer_log.(["cp-err_", car_comp(i)]);
  icp(:, i) = stabilizer_log.(["icp_", car_comp(i)]);
  
end

omega = stabilizer_log.omega;

figure(1)
clf

for j = 1:3

  subplot(3, 1, j);

  title(["com", car_comp(j), " des vs hat"], 'fontsize', 30)
    
  hold on;
  grid on;

  plot(t, com_des(:, j), 'Color',  'magenta', 'LineWidth', 2);
  plot(t, com_hat1(:, j), 'Color', 'green',     'LineWidth', 2);
  plot(t, com_hat2(:, j), 'Color', 'red',     'LineWidth', 2);

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
  #plot(t, zmp_cal(:, j), 'Color', 'black',   'LineWidth', 2);
  plot(t, zmp_hat(:, j), 'Color', 'red',     'LineWidth', 2);

end

figure(4)
clf

for j = 1:3

  subplot(3, 1, j);

  title(["com ", car_comp(j) , " err vs cp", car_comp(j), " err"], 'fontsize', 30)
    
  hold on;
  grid on;

  plot(t, com_err(:, j), 'Color', 'magenta', 'LineWidth', 2);
  plot(t, cp_err(:, j), 'Color', 'green', 'LineWidth', 2);

end

figure(5)
clf

for j = 1:3

  subplot(3, 1, j);

  title(["zmp", car_comp(j), " err (ref-cal) vs err2 (ref-res)"], 'fontsize', 30)
    
  hold on;
  grid on;

  plot(t, zmp_err_refcal(:, j), 'Color', 'red', 'LineWidth', 2);
  plot(t, zmp_err_refhat(:, j), 'Color', 'magenta', 'LineWidth', 2);

end

figure(6)
clf

for j = 1:3

  subplot(3, 1, j);

  title(["moment", car_comp(j), " err"], 'fontsize', 30)
    
  hold on;
  grid on;

  plot(t, moment_err(:, j), 'Color', 'magenta', 'LineWidth', 2);

end