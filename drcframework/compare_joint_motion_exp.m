function compare_joint_motion_exp(j, exp1, simdate1, simtime1, exp2, simdate2, simtime2)

data1 = get_joint_motion_exp(j, exp1, simdate1, simtime1);
data2 = get_joint_motion_exp(j, exp2, simdate2, simtime2);

figure(1)
clf

subplot(2, 1, 1)

title(["1) joint motion q ", num2str(j), " des vs hat"], 'fontsize', 30)
hold on;
grid on;

plot(data1.t, data1.qDes(:, j) * 180/pi, 'Color', 'magenta', 'LineWidth', 2);
plot(data1.t, data1.qHat(:, j) * 180/pi, 'Color', 'red', 'LineWidth', 2);

set(gca, "xminorgrid", "on")

h = get(gcf, "currentaxes");
set(h, "fontsize", 25);

subplot(2, 1, 2)

title(["2) joint motion q ", num2str(j), " des vs hat"], 'fontsize', 30)
hold on;
grid on;

plot(data2.t, data2.qDes(:, j) * 180/pi, 'Color', 'magenta', 'LineWidth', 2);
plot(data2.t, data2.qHat(:, j) * 180/pi, 'Color', 'red', 'LineWidth', 2);

set(gca, "xminorgrid", "on")

h = get(gcf, "currentaxes");
set(h, "fontsize", 25);

figure(2)
clf

subplot(2, 1, 1)

title(["1) joint velocity dq ", num2str(j), " ref vs hat"], 'fontsize', 30)
hold on;
grid on;

plot(data1.t, data1.dqRef(:, j) * 180/pi, 'Color', 'magenta', 'LineWidth', 2);
plot(data1.t, data1.dqHat(:, j) * 180/pi, 'Color', 'red', 'LineWidth', 2);

set(gca, "xminorgrid", "on")

h = get(gcf, "currentaxes");
set(h, "fontsize", 25);

subplot(2, 1, 2)

title(["1) joint velocity dq ", num2str(j), " ref vs hat"], 'fontsize', 30)
hold on;
grid on;

plot(data2.t, data2.dqRef(:, j) * 180/pi, 'Color', 'magenta', 'LineWidth', 2);
plot(data2.t, data2.dqHat(:, j) * 180/pi, 'Color', 'red', 'LineWidth', 2);

set(gca, "xminorgrid", "on")

h = get(gcf, "currentaxes");
set(h, "fontsize", 25);

figure(3)
clf

subplot(2, 1, 1)

title(["1) joint acceleration ddq ", num2str(j), " ref"], 'fontsize', 30)
hold on;
grid on;

plot(data1.t, data1.ddqRef(:, j) * 180/pi, 'Color', 'magenta', 'LineWidth', 2);

set(gca, "xminorgrid", "on")

h = get(gcf, "currentaxes");
set(h, "fontsize", 25);

subplot(2, 1, 2)

title(["1) joint acceleration ddq ", num2str(j), " ref"], 'fontsize', 30)
hold on;
grid on;

plot(data2.t, data2.ddqRef(:, j) * 180/pi, 'Color', 'magenta', 'LineWidth', 2);

set(gca, "xminorgrid", "on")

h = get(gcf, "currentaxes");
set(h, "fontsize", 25);

figure(4)
clf

subplot(2, 1, 1)

title(["1) joint torque q ", num2str(j), " comp vs P vs ref"], 'fontsize', 30)
hold on;
grid on;

plot(data1.t, data1.tauComp(:, j), 'Color', 'magenta', 'LineWidth', 2);
plot(data1.t, data1.tauP(:, j), 'Color', 'blue', 'LineWidth', 2);
plot(data1.t, data1.tauRef(:, j), 'Color', 'black', 'LineWidth', 2);

set(gca, "xminorgrid", "on")

h = get(gcf, "currentaxes");
set(h, "fontsize", 25);

subplot(2, 1, 2)

title(["2) joint torque q ", num2str(j), " comp vs P vs ref"], 'fontsize', 30)
hold on;
grid on;

plot(data2.t, data2.tauComp(:, j), 'Color', 'magenta', 'LineWidth', 2);
plot(data2.t, data2.tauP(:, j), 'Color', 'blue', 'LineWidth', 2);
plot(data2.t, data2.tauRef(:, j), 'Color', 'black', 'LineWidth', 2);

set(gca, "xminorgrid", "on")

h = get(gcf, "currentaxes");
set(h, "fontsize", 25);