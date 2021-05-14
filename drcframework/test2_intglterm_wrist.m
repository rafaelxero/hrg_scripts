% Test of the integral term components (exp vs sim) for the single joint (wrist) experiment

K = 5 * 0.167774;

data = get_joint_motion_exp(26, 0, "20200727", "1450");

tauP = K * (data.dqRef(1:end-1,26) - data.dqHat(2:end,26));
tauP = [0; tauP];

[data.t, data.dqRef(:,26), data.dqHat(:,26), tauP, data.tauP(:,26), tauP - data.tauP(:,26)]