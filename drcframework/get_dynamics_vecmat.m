function data = get_dynamics_vecmat(exp, simdate, simtime)

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

data.time = time;
data.alphaDVec_ref = alphaDVec_ref;
data.alphaVec_ref  = alphaVec_ref;
data.alphaVec_hat  = alphaVec_hat;
  
data.nonlinVec = nonlinVec;
data.massMat = massMat;
data.coriolisMat = coriolisMat;