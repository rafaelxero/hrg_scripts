function plot_contact_state(simdate, simtime)

%folder = ["~/src/rcisneros/hrg/logs/simulations/AdvancedRobotics2/Flat/FullStabilizer/"];
folder = "/tmp/";

car_comp = ["x", "y", "z"];

contact_state_log = get_structure([folder, "hmc_", simdate, simtime, "-contact-state.log"]);

t = contact_state_log.time;

for i = 1:3

  rfoot_force_hat(:, i) = contact_state_log.(["rfoot-force_", car_comp(i)]);
  lfoot_force_hat(:, i) = contact_state_log.(["lfoot-force_", car_comp(i)]);
  rhand_force_hat(:, i) = contact_state_log.(["rhand-force_", car_comp(i)]);
  rhand_force_hat(:, i) = contact_state_log.(["lhand-force_", car_comp(i)]);

  rfoot_fdistrat_des(:, i) = contact_state_log.(["rfoot-fdistrat-des_", car_comp(i)]);
  rfoot_fdistrat_ref(:, i) = contact_state_log.(["rfoot-fdistrat-ref_", car_comp(i)]);
  rfoot_fdistrat_hat(:, i) = contact_state_log.(["rfoot-fdistrat-hat_", car_comp(i)]);
  lfoot_fdistrat_des(:, i) = contact_state_log.(["lfoot-fdistrat-des_", car_comp(i)]);
  lfoot_fdistrat_ref(:, i) = contact_state_log.(["lfoot-fdistrat-ref_", car_comp(i)]);
  lfoot_fdistrat_hat(:, i) = contact_state_log.(["lfoot-fdistrat-hat_", car_comp(i)]);
  rhand_fdistrat_des(:, i) = contact_state_log.(["rhand-fdistrat-des_", car_comp(i)]);
  rhand_fdistrat_ref(:, i) = contact_state_log.(["rhand-fdistrat-ref_", car_comp(i)]);
  rhand_fdistrat_hat(:, i) = contact_state_log.(["rhand-fdistrat-hat_", car_comp(i)]);
  lhand_fdistrat_des(:, i) = contact_state_log.(["lhand-fdistrat-des_", car_comp(i)]);
  lhand_fdistrat_ref(:, i) = contact_state_log.(["lhand-fdistrat-ref_", car_comp(i)]);
  lhand_fdistrat_hat(:, i) = contact_state_log.(["lhand-fdistrat-hat_", car_comp(i)]);
  
end

rfoot_contact = contact_state_log.("rfoot-contact");
lfoot_contact = contact_state_log.("lfoot-contact");
rhand_contact = contact_state_log.("rhand-contact");
lhand_contact = contact_state_log.("lhand-contact");

figure(1)
clf

for j = 1:3

  subplot(3, 1, j);

  title(["rfoot fdistratio", car_comp(j), " des vs ref vs hat"], 'fontsize', 30)
    
  hold on;
  grid on;

  plot(t, rfoot_contact,            'Color', 'green',   'LineWidth', 2);
  plot(t, rfoot_fdistrat_des(:, j), 'Color', 'magenta', 'LineWidth', 2);
  plot(t, rfoot_fdistrat_ref(:, j), 'Color', 'blue',    'LineWidth', 2);
  plot(t, rfoot_fdistrat_hat(:, j), 'Color', 'red',     'LineWidth', 2);
  
end

figure(2)
clf

for j = 1:3

  subplot(3, 1, j);

  title(["lfoot fdistratio", car_comp(j), " des vs ref vs hat"], 'fontsize', 30)
    
  hold on;
  grid on;

  plot(t, lfoot_contact,            'Color', 'green',   'LineWidth', 2);
  plot(t, lfoot_fdistrat_des(:, j), 'Color', 'magenta', 'LineWidth', 2);
  plot(t, lfoot_fdistrat_ref(:, j), 'Color', 'blue',    'LineWidth', 2);
  plot(t, lfoot_fdistrat_hat(:, j), 'Color', 'red',     'LineWidth', 2);
  
end

figure(3)
clf

for j = 1:3

  subplot(3, 1, j);

  title(["rhand fdistratio", car_comp(j), " des vs ref vs hat"], 'fontsize', 30)
    
  hold on;
  grid on;

  plot(t, rhand_contact,            'Color', 'green',   'LineWidth', 2);
  plot(t, rhand_fdistrat_des(:, j), 'Color', 'magenta', 'LineWidth', 2);
  plot(t, rhand_fdistrat_ref(:, j), 'Color', 'blue',    'LineWidth', 2);
  plot(t, rhand_fdistrat_hat(:, j), 'Color', 'red',     'LineWidth', 2);
  
end

figure(4)
clf

for j = 1:3

  subplot(3, 1, j);

  title(["lhand fdistratio", car_comp(j), " des vs ref vs hat"], 'fontsize', 30)
    
  hold on;
  grid on;

  plot(t, lhand_contact,            'Color', 'green',   'LineWidth', 2);
  plot(t, lhand_fdistrat_des(:, j), 'Color', 'magenta', 'LineWidth', 2);
  plot(t, lhand_fdistrat_ref(:, j), 'Color', 'blue',    'LineWidth', 2);
  plot(t, lhand_fdistrat_hat(:, j), 'Color', 'red',     'LineWidth', 2);
  
end

figure(5)
clf

title("rfoot vs lfoot contact")

hold on;
grid on;

plot(t, rfoot_contact, 'Color', 'red',  'LineWidth', 2);
plot(t, lfoot_contact, 'Color', 'blue', 'LineWidth', 2);

figure(6)
clf

for j = 1:3

  subplot(3, 1, j);

  title(["rfoot force", car_comp(j), " hat"], 'fontsize', 30)
    
  hold on;
  grid on;

  plot(t, rfoot_force_hat(:, j), 'Color', 'red',     'LineWidth', 2);
  
end