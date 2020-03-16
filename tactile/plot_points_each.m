function plot_points_each(ini_time, foot, data_raw, data_hull, data_proc)

figure(1)
fig = gcf;

for k = 1 : size(data_proc, 2)
  if (abs(ini_time - data_proc(k).time) < 1E-3)
    break;
  end
end

if strcmp(foot, "left")
  foot_points = [-0.1019,  0.0875;
                  0.1490,  0.0875;
                  0.1490, -0.0580;
                 -0.1019, -0.0580];
else
  foot_points = [-0.1019,  0.0580;
                  0.1490,  0.0580;
                  0.1490, -0.0875;
                 -0.1019, -0.0875];
end
foot_points = [foot_points; foot_points(1, :)];

while true

  for i = 1 : size(data_raw, 2)
    if (abs(data_proc(k).time - data_raw(i).time) < 1E-3)
      break;
    end
  end
  
  for j = 1 : size(data_hull, 2)
    if (abs(data_proc(k).time - data_hull(j).time) < 1E-3)
      break;
    end
  end

  disp([i, data_raw(i).time]);
  disp([j, data_hull(j).time]);
  disp([k, data_proc(k).time]);
  
  clf
  
  hold on

  raw_points  = data_raw(i).points;
  hull_points = [data_hull(j).points; data_hull(k).points(1, :)];
  proc_points = [data_proc(k).points; data_proc(k).points(1, :)];
  
  plot(foot_points(:, 1), foot_points(:, 2), 'Color', 'black')
  plot(raw_points(:, 1),  raw_points(:, 2),  'Color', 'blue', '*')
  plot(hull_points(:, 1), hull_points(:, 2), 'Color', 'magenta')
  plot(proc_points(:, 1), proc_points(:, 2), 'Color', 'red')
  
  [~, ~, b] = ginput(1)
  
  if (b == 46)   # >
    k = k + 1;
    if k > length(data_raw)
      k = length(data_raw)
    end
  elseif (b == 44)   # <
    k = k - 1;
    if k < 1
      k = 1;
    end
  elseif (b == 27)   # ESC
    break;
  end
  
end