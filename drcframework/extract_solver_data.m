function reg = extract_solver_data(data, time)

for i = 1 : size(data, 2)
  if (abs(data(i).time - time) < 1E-6)
    break;
  end
end

reg = data(i);