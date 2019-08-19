function plot_joint_motion(j)

%folder = "~/tmp/log/";
folder = "/tmp/";

simdate = "20190819";
simtime = "1618";  %1536

joint_motion_log = get_structure([folder, "hmc_", simdate, simtime, "-joint-motion.log"]);

t = joint_motion_log.time;

for i = 1:53
  qRef(:, i) = joint_motion_log.(["qRef_", num2str(i - 1)]);
  dqRef(:, i) = joint_motion_log.(["dqRef_", num2str(i - 1)]);
  ddqRef(:, i) = joint_motion_log.(["ddqRef_", num2str(i - 1)]);
  tauRef(:, i) = joint_motion_log.(["tauRef_", num2str(i - 1)]);
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

figure(2)
clf

title(["joint torque q ", num2str(j), " ref vs P"], 'fontsize', 30)
hold on;
grid on;

plot(t, tauRef(:, j), 'Color', 'black', 'LineWidth', 2);
plot(t, tauP(:, j), 'Color', 'blue', 'LineWidth', 2);