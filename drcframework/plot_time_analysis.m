function plot_time_analysis(exp, simdate, simtime)

if (exp == 1)
  folder = ["~/src/rcisneros/hrg/logs/experiments/", simdate, "/"];
else
  folder = "/tmp/";
end

%simdate = "20191121";
%simtime = "0943";

#time_log = get_structure(["/tmp/hmc_", simdate, simtime, "-time.log"]);
#elapsed_times_log = get_structure(["/tmp/hmc_", simdate, simtime, "-elapsed-times.log"]);
elapsed_times_log = get_structure([folder, 'hmc_', simdate, simtime, "-elapsed-times.log"]);

t = elapsed_times_log.time;

MCMSExecute = elapsed_times_log.("mcms_MCMSExecute");
QPSolverRun = elapsed_times_log.("mcms_QPSolverRun");

updateCurrentState = elapsed_times_log.("mcms_updateCurrentState");
computeFbTerm = elapsed_times_log.("mcms_computeFbTerm");
solve = elapsed_times_log.("mcms_solve");

Gain = elapsed_times_log.("mcms_computeFbTerm-Gain");
Gain_Coriolis = elapsed_times_log.("mcms_computeFbTerm-Gain-Coriolis");
GammaD = elapsed_times_log.("mcms_computeFbTerm-GammaD");

figure(1)

subplot(2, 1, 1)
hist(MCMSExecute, 0 : 250 : 5500)
set(gca, "fontsize", 15)
xlabel("time [us]", 'fontsize', 20)
ylabel("frequency", 'fontsize', 20)
title("MCMSExecute", 'fontsize', 30)

subplot(2, 1, 2)
hist(QPSolverRun, 0 : 250 : 5500)
set(gca, "fontsize", 15)
xlabel("time [us]", 'fontsize', 20)
ylabel("frequency", 'fontsize', 20)
title("QPSolverRun", 'fontsize', 30)

figure(2)

subplot(3, 1, 1)
hist(updateCurrentState, 0 : 250 : 5500)
set(gca, "fontsize", 15)
xlabel("time [us]", 'fontsize', 20)
ylabel("frequency", 'fontsize', 20)
title("updateCurrentState", 'fontsize', 30)

subplot(3, 1, 2)
hist(computeFbTerm, 0 : 250 : 5500)
set(gca, "fontsize", 15)
xlabel("time [us]", 'fontsize', 20)
ylabel("frequency", 'fontsize', 20)
title("computeFbTerm", 'fontsize', 30)

subplot(3, 1, 3)
hist(solve, 0 : 250 : 5500)
set(gca, "fontsize", 15)
xlabel("time [us]", 'fontsize', 20)
ylabel("frequency", 'fontsize', 20)
title("solve", 'fontsize', 30)

figure(3)

subplot(3, 1, 1)
hist(Gain, 0 : 250 : 5500)
set(gca, "fontsize", 15)
xlabel("time [us]", 'fontsize', 20)
ylabel("frequency", 'fontsize', 20)
title("Gain", 'fontsize', 30)

subplot(3, 1, 2)
hist(Gain_Coriolis, 0 : 250 : 5500)
set(gca, "fontsize", 15)
xlabel("time [us]", 'fontsize', 20)
ylabel("frequency", 'fontsize', 20)
title("Gain Coriolis", 'fontsize', 30)

subplot(3, 1, 3)
hist(GammaD, 0 : 250 : 5500)
set(gca, "fontsize", 15)
xlabel("time [us]", 'fontsize', 20)
ylabel("frequency", 'fontsize', 20)
title("GammaD", 'fontsize', 30)