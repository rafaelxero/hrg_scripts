function reg = extract_solver_data(data, time)

for i = 1 : size(data, 2)
  if (data(i).time == time)
    break;
  end
end

reg = data(i);