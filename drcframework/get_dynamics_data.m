function data = get_dynamics_data(exp, simdate, simtime)

if (exp == 1)
  folder = ["~/src/rcisneros/hrg/logs/experiments/", simdate, "/"];
else
  folder = "/tmp/";
end

dynamics_data_log = get_structure([folder, "hmc_", simdate, simtime, "-dynamics-data.log"]);

time = dynamics_data_log.time;

for i = 1:8

  alphaDVec_ref(:, i) = dynamics_data_log.(["alphaDVec-ref_", num2str(i - 1)]);
  alphaVec_ref(:, i)  = dynamics_data_log.(["alphaVec-ref_", num2str(i - 1)]);
  alphaVec_hat(:, i)  = dynamics_data_log.(["alphaVec-hat_", num2str(i - 1)]);
  
  nonlinVec(:, i)  = dynamics_data_log.(["nonlinVec_", num2str(i - 1)]);
  for j = 1:8
    massMat(:, 8 * (j - 1) + i)  = dynamics_data_log.(["massMat_", num2str(j - 1), num2str(i - 1)]);
    coriolisMat(:, 8 * (j - 1) + i)  = dynamics_data_log.(["coriolisMat_", num2str(j - 1), num2str(i - 1)]);
  end
  
 end
 
 for k = 1:length(time)
 
  data(k).time = time(k);
  
  data(k).alphaDVec_ref = alphaDVec_ref(k, :)';
  data(k).alphaVec_ref  = alphaVec_ref(k, :)';
  data(k).alphaVec_hat  = alphaVec_hat(k, :)';
  
  data(k).nonlinVec = nonlinVec(k, :)';
  data(k).massMatrix = reshape(massMat(k, :), 8, 8);
  data(k).coriolisMat = reshape(coriolisMat(k, :), 8, 8);
 
 end