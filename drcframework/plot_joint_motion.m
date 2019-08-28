function plot_joint_motion(j)

simdate = "20190827";
simtime = "2302";

%folder = ["~/tmp/log/", simdate, "/"];
folder = "/tmp/";

joint_motion_log = get_structure([folder, "hmc_", simdate, simtime, "-joint-motion.log"]);

t = joint_motion_log.time;

for i = 1:6
  waistComp(:, i) = joint_motion_log.(["waistWrenchComp_", num2str(i - 1)]);
  waistP(:, i) = joint_motion_log.(["waistWrenchP_", num2str(i - 1)]);
end

for i = 1:53
  qRef(:, i) = joint_motion_log.(["qRef_", num2str(i - 1)]);
  dqRef(:, i) = joint_motion_log.(["dqRef_", num2str(i - 1)]);
  ddqRef(:, i) = joint_motion_log.(["ddqRef_", num2str(i - 1)]);
  tauRef(:, i) = joint_motion_log.(["tauRef_", num2str(i - 1)]);
  tauComp(:, i) = joint_motion_log.(["tauComp_", num2str(i - 1)]);
  tauFric(:, i) = joint_motion_log.(["tauFric_", num2str(i - 1)]);
  tauP(:, i) = joint_motion_log.(["tauP_", num2str(i - 1)]);
  qDes(:, i) = joint_motion_log.(["qDes_", num2str(i - 1)]);
  qHat(:, i) = joint_motion_log.(["qHat_", num2str(i - 1)]);
  dqHat(:, i) = joint_motion_log.(["dqHat_", num2str(i - 1)]);
  ddqHat(:, i) = joint_motion_log.(["ddqHat_", num2str(i - 1)]);
end

figure(1)
clf

title(["joint motion q ", num2str(j), " des vs hat"], 'fontsize', 30)
hold on;
grid on;

plot(t, qDes(:, j) * 180/pi, 'Color', 'magenta', 'LineWidth', 2);
plot(t, qHat(:, j) * 180/pi, 'Color', 'red', 'LineWidth', 2);

set(gca, "xminorgrid", "on")

figure(2)
clf

title(["joint torque q ", num2str(j), " comp vs P vs ref"], 'fontsize', 30)
hold on;
grid on;

plot(t, tauComp(:, j), 'Color', 'magenta', 'LineWidth', 2);
plot(t, tauFric(:, j), 'color', 'red', 'LineWidth', 2);
plot(t, tauP(:, j), 'Color', 'blue', 'LineWidth', 2);
plot(t, tauRef(:, j), 'Color', 'black', 'LineWidth', 2);

set(gca, "xminorgrid", "on")

figure(3)
clf

title(["waist force comp vs P"], "fontSize", 30);
hold on;
grid on;

for i = 1:3
  plot(t, waistComp(:, i), '--', 'Color', eye(3)(:, i), 'LineWidth', 2);
  plot(t, waistP(:, i), 'Color', eye(3)(:, i), 'LineWidth', 2);
end

figure(4)
clf

title(["waist moment comp vs P"], "fontSize", 30);
hold on;
grid on;

for i = 4:6
  plot(t, waistComp(:, i), '--', 'Color', eye(3)(:, i - 3), 'LineWidth', 2);
  plot(t, waistP(:, i), 'Color', eye(3)(:, i - 3), 'LineWidth', 2);
end
