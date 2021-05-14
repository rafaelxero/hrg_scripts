k = 1;
for t = 3.845 : 0.005 : 3.855
  t
  rec(k) = extract_solver_data(data, t);
  rec(k).time;
  k = k + 1;
end

for i = 1 : length(rec(1).tasks)
  for j = 2 : length(rec)
    maxA_tasks(j - 1) = max(max(abs(rec(j).tasks(i).A - rec(j - 1).tasks(i).A)));
  end
  i
  rec(1).tasks(i).name
  maxA_tasks
end

for i = 1 : length(rec(1).tasks)
  for j = 2 : length(rec)
    maxb_tasks(j - 1) = max(abs(rec(j).tasks(i).b - rec(j - 1).tasks(i).b));
  end
  i
  rec(1).tasks(i).name
  maxb_tasks
end

for i = 1 : length(rec(1).genInEqConstr)
  for j = 2 : length(rec)
    maxA_genInEqConstr(j - 1) = max(max(abs(rec(j).genInEqConstr(i).A - rec(j - 1).genInEqConstr(i).A)));
  end
  i
  rec(1).genInEqConstr(i).name
  maxA_genInEqConstr
end

for i = 1 : length(rec(1).genInEqConstr)
  for j = 2 : length(rec)
    maxub_genInEqConstr(j - 1) = max(abs(rec(j).genInEqConstr(i).ub - rec(j - 1).genInEqConstr(i).ub));
  end
  i
  rec(1).genInEqConstr(i).name
  maxub_genInEqConstr
end

for i = 1 : length(rec(1).genInEqConstr)
  for j = 2 : length(rec)
    maxlb_genInEqConstr(j - 1) = max(abs(rec(j).genInEqConstr(i).lb - rec(j - 1).genInEqConstr(i).lb));
  end
  i
  rec(1).genInEqConstr(i).name
  maxlb_genInEqConstr
end

for i = 1 : length(rec(1).boundConstr)
  for j = 2 : length(rec)
    maxub_boundConstr(j - 1) = max(abs(rec(j).boundConstr(i).ub - rec(j - 1).boundConstr(i).ub));
  end
  i
  rec(1).boundConstr(i).name
  maxub_boundConstr
end

for i = 1 : length(rec(1).boundConstr)
  for j = 2 : length(rec)
    maxlb_boundConstr(j - 1) = max(abs(rec(j).boundConstr(i).lb - rec(j - 1).boundConstr(i).lb));
  end
  i
  rec(1).boundConstr(i).name
  maxlb_boundConstr
end