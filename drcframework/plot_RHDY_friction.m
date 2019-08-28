function plot_RHDY_friction()

% This script assumes that only RHDY (26) was in motion
j = 26;
% The mass of the hand is 2.6694 kg
m = 2.6694;

simdate = "20190825";
simtime = "0022";

%folder = "~/tmp/log/20190821/";
folder = "/tmp/";

joint_motion_log = get_structure([folder, "hmc_", simdate, simtime, "-joint-motion.log"]);

t = joint_motion_log.time;

for i = 1:53
  ddqRef(:, i) = joint_motion_log.(["ddqRef_", num2str(i - 1)]);
  tauRef(:, i) = joint_motion_log.(["tauRef_", num2str(i - 1)]);
  dqHat(:, i) = joint_motion_log.(["dqHat_", num2str(i - 1)]);
  ddqHat(:, i) = joint_motion_log.(["ddqHat_", num2str(i - 1)]);
end

tauF = tauRef(:, j) - m * ddqHat(:, j);
tauF_old = [0; tauF(1 : end - 1)];

tauF_fil = zeros(length(tauF), 1);
tauF_fil_old = 0;
for k = 1 : length(tauF)
  tauF_fil(k) = LPFilter(tauF(k), tauF_old(k), tauF_fil_old, 0.1);
  tauF_fil_old = tauF_fil(k);
end

figure(5)
clf

title(["RHDY speed"], 'fontsize', 30)
grid on
hold on

plot(t, dqHat(:, j) * 180/pi, 'Color', 'blue', 'LineWidth', 2);

set(gca, "xminorgrid", "on")

figure(6)
clf

title(["RHDY friction torque"], 'fontsize', 30)
grid on
hold on

plot(t, tauF, 'Color', 'magenta', 'LineWidth', 2);
plot(t, tauF_fil, 'Color', 'red', 'LineWidth', 2);

set(gca, "xminorgrid", "on")

figure(7)
clf

title(["RHDY acceleration"], 'fontsize', 30)
grid on
hold on

plot(t, ddqRef(:, j), 'Color', 'red', 'LineWidth', 2);

set(gca, "xminorgrid", "on")