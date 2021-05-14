function data = get_joint_motion_exp(j, exp, simdate, simtime)

if (exp == 1)
  folder = ["~/src/rcisneros/hrg/logs/experiments/", simdate, "/"];
else
  folder = "/tmp/";
end
  
car_comp = ["x", "y", "z"];
rot_comp = {"Rpy", "rPy", "rpY"};

joint_motion_log = get_structure([folder, "hmc_", simdate, simtime, "-joint-motion.log"]);

data.t = joint_motion_log.time;

for i = 1:3
  data.waistPosHat(:, i) = joint_motion_log.(["waistHat_P", car_comp(i)]);
  data.waistLinVelHat(:, i) = joint_motion_log.(["waistHat_V", car_comp(i)]);
  data.waistLinAccHat(:, i) = joint_motion_log.(["waistHat_Vdot", car_comp(i)]);
  data.waistRotHat(:, i) = joint_motion_log.(["waistHat_R_", rot_comp{i}]);
  data.waistAngVelHat(:, i) = joint_motion_log.(["waistHat_W", car_comp(i)]);
  data.waistAngAccHat(:, i) = joint_motion_log.(["waistHat_Wdot", car_comp(i)]);
  data.waistPosRef(:, i) = joint_motion_log.(["waistRef_P", car_comp(i)]);
  data.waistLinVelRef(:, i) = joint_motion_log.(["waistRef_V", car_comp(i)]);
  data.waistLinAccRef(:, i) = joint_motion_log.(["waistRef_Vdot", car_comp(i)]);
  data.waistRotRef(:, i) = joint_motion_log.(["waistRef_R_", rot_comp{i}]);
  data.waistAngVelRef(:, i) = joint_motion_log.(["waistRef_W", car_comp(i)]);
  data.waistAngAccRef(:, i) = joint_motion_log.(["waistRef_Wdot", car_comp(i)]);
end

for i = 1:6
  data.waistComp(:, i) = joint_motion_log.(["waistWrenchComp_", num2str(i - 1)]);
  data.waistP(:, i) = joint_motion_log.(["waistWrenchP_", num2str(i - 1)]);
end

for i = 1:53
  data.qRef(:, i) = joint_motion_log.(["qRef_", num2str(i - 1)]);
  data.dqRef(:, i) = joint_motion_log.(["dqRef_", num2str(i - 1)]);
  data.ddqRef(:, i) = joint_motion_log.(["ddqRef_", num2str(i - 1)]);
  data.torqueMode(:, i) = joint_motion_log.(["torqueMode_", num2str(i - 1)]);
  data.tauRef(:, i) = joint_motion_log.(["tauRef_", num2str(i - 1)]);
  data.tauComp(:, i) = joint_motion_log.(["tauComp_", num2str(i - 1)]);
  data.tauFric(:, i) = joint_motion_log.(["tauFric_", num2str(i - 1)]);
  data.tauP(:, i) = joint_motion_log.(["tauP_", num2str(i - 1)]);
  data.tauHat(:, i) = joint_motion_log.(["tauHat_", num2str(i - 1)]);
  data.qDes(:, i) = joint_motion_log.(["qDes_", num2str(i - 1)]);
  data.qHat(:, i) = joint_motion_log.(["qHat_", num2str(i - 1)]);
  data.dqHat(:, i) = joint_motion_log.(["dqHat_", num2str(i - 1)]);
  data.ddqHat(:, i) = joint_motion_log.(["ddqHat_", num2str(i - 1)]);
end