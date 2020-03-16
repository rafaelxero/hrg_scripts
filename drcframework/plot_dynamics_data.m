function plot_dynamics_data(data)

t = data.time;

figure(1)
clf

title(["alphaVec ref vs hat"], 'fontsize', 30)
hold on;
grid on;

plot(t, data.alphaVec_ref(:, 7:8), 'LineWidth', 2);
plot(t, data.alphaVec_hat(:, 7:8), '--', 'LineWidth', 2);

set(gca, "xminorgrid", "on")

h = get(gcf, "currentaxes");
set(h, "fontsize", 25);

figure(2)
clf

title(["massMat"], 'fontsize', 30)
hold on;
grid on;

plot(t, data.massMat, 'LineWidth', 2);

set(gca, "xminorgrid", "on")

h = get(gcf, "currentaxes");
set(h, "fontsize", 25);

figure(3)
clf

title(["coriolisMat"], 'fontsize', 30)
hold on;
grid on;

plot(t, data.coriolisMat, 'LineWidth', 2);

set(gca, "xminorgrid", "on")

h = get(gcf, "currentaxes");
set(h, "fontsize", 25);

figure(4)
clf

title(["nonlinVec"], 'fontsize', 30)
hold on;
grid on;

plot(t, data.nonlinVec, 'LineWidth', 2);

set(gca, "xminorgrid", "on")

h = get(gcf, "currentaxes");
set(h, "fontsize", 25);