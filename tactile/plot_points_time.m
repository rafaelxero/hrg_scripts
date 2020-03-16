function plot_points_time(time, data_raw, data_proc)

for i = 1 : size(data_raw, 2)
  if (abs(data_raw(i).time - time) < 1E-3)
    break;
  end
end

for j = 1 : size(data_proc, 2)
  if (abs(data_proc(j).time - time) < 1E-2)
    break;
  end
end

t = data_raw(i).time;
disp([t i]);
t = data_proc(j).time;
disp([t j]);

figure(1)
clf

hold on

raw_points  = data_raw(i).points
proc_points = [data_proc(j).points; data_proc(j).points(1, :)]

plot(raw_points(:, 1),  raw_points(:, 2),  'Color', 'blue', '*')
plot(proc_points(:, 1), proc_points(:, 2), 'Color', 'red')