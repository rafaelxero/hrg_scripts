function data = get_solver_data(exp, simdate, simtime)

if (exp == 1)
  folder = ["~/src/rcisneros/hrg/logs/experiments/", simdate, "/"];
else
  folder = "/tmp/";
end

filename = [folder, "hmc_", simdate, simtime, "-solver-data.log"]

fid = fopen(filename);

title = fgetl(fid);
fields_raw = strsplit(strtrim(title));
for i = 2 : length(fields_raw)
  id_name = regexp(fields_raw{i}, "[0-9a-zA-Z-_()]+", 'match');
  fields(i - 1).id = id_name{1};
  fields(i - 1).name = id_name{2};
end

i = 1;
while (!feof(fid))

  line = fgetl(fid);
  data_raw = strsplit(strtrim(line));
  
  data(i).time = str2num(data_raw{1});

  ind = 2;
  
  for j = 2 : (size(fields, 2))
  
    vec_size = str2num(data_raw{ind}); ind = ind + 1;
    
    if (vec_size > 0)
    
      for k = 1 : vec_size
      
        data(i).(fields(j).name)(k).name = data_raw{ind}; ind = ind + 1;
        
        rows   = str2num(data_raw{ind}); ind = ind + 1;
        cols   = str2num(data_raw{ind}); ind = ind + 1;
        sides  = str2num(data_raw{ind}); ind = ind + 1;
        if (sides == 1)
          len  = str2num(data_raw{ind}); ind = ind + 1;
        elseif (sides == 2)
          lenl = str2num(data_raw{ind}); ind = ind + 1;
          lenu = str2num(data_raw{ind}); ind = ind + 1;
        end
        
        for m = 1 : rows
          for n = 1 : cols
            data(i).(fields(j).name)(k).A(m, n) = str2double(data_raw{ind}); ind = ind + 1;
          end
        end
        
        if (sides == 1)
          for n = 1 : len
            data(i).(fields(j).name)(k).b(n) = str2double(data_raw{ind}); ind = ind + 1;
          end
        elseif (sides == 2)
          for n = 1 : lenl
            data(i).(fields(j).name)(k).lb(n) = str2double(data_raw{ind}); ind = ind + 1;
          end
          for n = 1 : lenu
            data(i).(fields(j).name)(k).ub(n) = str2double(data_raw{ind}); ind = ind + 1;
          end
        end
        
      end
    
    end
    
  end
  
  i = i + 1;
  
end

fclose(fid);