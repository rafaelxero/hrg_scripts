function plot_joint_motion_exp(j, exp, simdate, simtime)

if (exp == 1)
  folder = ["~/src/rcisneros/hrg/logs/experiments/", simdate, "/"];
else
  folder = "/tmp/";
end
  
car_comp = ["x", "y", "z"];
rot_comp = {"Rpy", "rPy", "rpY"};

joint_motion_log = get_structure([folder, "hmc_", simdate, simtime, "-joint-motion.log"]);

t = joint_motion_log.time;
%t = 0 : 0.005 : (t(end) - t(1));

for i = 1:3
  waistPosHat(:, i) = joint_motion_log.(["waistHat_P", car_comp(i)]);
  waistLinVelHat(:, i) = joint_motion_log.(["waistHat_V", car_comp(i)]);
  waistLinAccHat(:, i) = joint_motion_log.(["waistHat_Vdot", car_comp(i)]);
  waistRotHat(:, i) = joint_motion_log.(["waistHat_R_", rot_comp{i}]);
  waistAngVelHat(:, i) = joint_motion_log.(["waistHat_W", car_comp(i)]);
  waistAngAccHat(:, i) = joint_motion_log.(["waistHat_Wdot", car_comp(i)]);
  waistPosRef(:, i) = joint_motion_log.(["waistRef_P", car_comp(i)]);
  waistLinVelRef(:, i) = joint_motion_log.(["waistRef_V", car_comp(i)]);
  waistLinAccRef(:, i) = joint_motion_log.(["waistRef_Vdot", car_comp(i)]);
  waistRotRef(:, i) = joint_motion_log.(["waistRef_R_", rot_comp{i}]);
  waistAngVelRef(:, i) = joint_motion_log.(["waistRef_W", car_comp(i)]);
  waistAngAccRef(:, i) = joint_motion_log.(["waistRef_Wdot", car_comp(i)]);
end

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
  tauHat(:, i) = joint_motion_log.(["tauHat_", num2str(i - 1)]);
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

h = get(gcf, "currentaxes");
set(h, "fontsize", 25);

figure(2)
clf

title(["joint torque q ", num2str(j), " comp vs P vs ref"], 'fontsize', 30)
hold on;
grid on;

plot(t, tauComp(:, j), 'Color', 'magenta', 'LineWidth', 2);
plot(t, tauFric(:, j), 'color', 'red', 'LineWidth', 2);
plot(t, tauP(:, j), 'Color', 'blue', 'LineWidth', 2);
plot(t, tauRef(:, j), 'Color', 'black', 'LineWidth', 2);
plot(t, tauHat(:, j), 'Color', 'green', 'LineWidth', 2);

set(gca, "xminorgrid", "on")

h = get(gcf, "currentaxes");
set(h, "fontsize", 25);

figure(3)
clf

title(["waist force comp vs P"], "fontSize", 30);
hold on;
grid on;

for i = 1:3
  plot(t, waistComp(:, i), '--', 'Color', eye(3)(:, i), 'LineWidth', 2);
  plot(t, waistP(:, i), 'Color', eye(3)(:, i), 'LineWidth', 2);
end

h = get(gcf, "currentaxes");
set(h, "fontsize", 25);

figure(4)
clf

title(["waist moment comp vs P"], "fontSize", 30);
hold on;
grid on;

for i = 4:6
  plot(t, waistComp(:, i), '--', 'Color', eye(3)(:, i - 3), 'LineWidth', 2);
  plot(t, waistP(:, i), 'Color', eye(3)(:, i - 3), 'LineWidth', 2);
end

h = get(gcf, "currentaxes");
set(h, "fontsize", 25);

figure(5)
clf

title(["waist position ref vs hat"], "fontSize", 30);
hold on;
grid on;

for i = 1:3
  plot(t, waistPosRef(:, i), 'Color', eye(3)(:, i), 'LineWidth', 2);
  plot(t, waistPosHat(:, i), '--', 'Color', eye(3)(:, i), 'LineWidth', 2);
end

h = get(gcf, "currentaxes");
set(h, "fontsize", 25);

figure(6)
clf

title(["waist linear velocity ref vs hat"], "fontSize", 30);
hold on;
grid on;

for i = 1:3
  plot(t, waistLinVelRef(:, i), 'Color', eye(3)(:, i), 'LineWidth', 2);
  plot(t, waistLinVelHat(:, i), '--', 'Color', eye(3)(:, i), 'LineWidth', 2);
end

h = get(gcf, "currentaxes");
set(h, "fontsize", 25);

figure(7)
clf

title(["waist linear acceleration ref vs hat"], "fontSize", 30);
hold on;
grid on;

for i = 1:3
  plot(t, waistLinAccRef(:, i), 'Color', eye(3)(:, i), 'LineWidth', 2);
  plot(t, waistLinAccHat(:, i), '--', 'Color', eye(3)(:, i), 'LineWidth', 2);
end

h = get(gcf, "currentaxes");
set(h, "fontsize", 25);

figure(8)
clf

title(["waist angular velocity ref vs hat"], "fontSize", 30);
hold on;
grid on;

for i = 1:3
  plot(t, waistAngVelRef(:, i), 'Color', eye(3)(:, i), 'LineWidth', 2);
  plot(t, waistAngVelHat(:, i), '--', 'Color', eye(3)(:, i), 'LineWidth', 2);
end

h = get(gcf, "currentaxes");
set(h, "fontsize", 25);

figure(9)
clf

title(["waist angular acceleration ref vs hat"], "fontSize", 30);
hold on;
grid on;

for i = 1:3
  plot(t, waistAngAccRef(:, i), 'Color', eye(3)(:, i), 'LineWidth', 2);
  plot(t, waistAngAccHat(:, i), '--', 'Color', eye(3)(:, i), 'LineWidth', 2);
end

h = get(gcf, "currentaxes");
set(h, "fontsize", 25);