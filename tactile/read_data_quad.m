filename = "/tmp/TactileTest.lftactileInfoRaw";

fid = fopen(filename);

i = 1;
while (!feof(fid))

  line = fgetl(fid);
  data_cells = strsplit(strtrim(line));
  
  data_lf_raw(i).time = str2num(data_cells{1});
  ind = 2;
  
  for j = 1 : (length(data_cells) - 1) / 5
    data_lf_raw(i).points(j, 1) = str2num(data_cells{ind}); ind = ind + 1;
    data_lf_raw(i).points(j, 2) = str2num(data_cells{ind}); ind = ind + 1;
    data_lf_raw(i).forces(j, 1) = str2num(data_cells{ind}); ind = ind + 1;
    data_lf_raw(i).forces(j, 2) = str2num(data_cells{ind}); ind = ind + 1;
    data_lf_raw(i).forces(j, 3) = str2num(data_cells{ind}); ind = ind + 1;
  end
  
  i = i + 1;

end

fclose(fid);

%%%

filename = "/tmp/TactileTest.lftactileInfoHull";

fid = fopen(filename);

i = 1;
while (!feof(fid))

  line = fgetl(fid);
  data_cells= strsplit(strtrim(line));
  
  data_lf_hull(i).time = str2num(data_cells{1});
  ind = 2;
  
  for j = 1 : (length(data_cells) - 1) / 2
    data_lf_hull(i).points(j, 1) = str2num(data_cells{ind}); ind = ind + 1;
    data_lf_hull(i).points(j, 2) = str2num(data_cells{ind}); ind = ind + 1;
  end
  
  i = i + 1;

end

fclose(fid);

%%%

filename = "/tmp/TactileTest.lftactileInfoProc";

fid = fopen(filename);

i = 1;
while (!feof(fid))

  line = fgetl(fid);
  data_cells= strsplit(strtrim(line));
  
  data_lf_proc(i).time = str2num(data_cells{1});
  ind = 2;
  
  for j = 1 : (length(data_cells) - 1) / 2
    data_lf_proc(i).points(j, 1) = str2num(data_cells{ind}); ind = ind + 1;
    data_lf_proc(i).points(j, 2) = str2num(data_cells{ind}); ind = ind + 1;
  end
  
  i = i + 1;

end

fclose(fid);

%%%

filename = "/tmp/TactileTest.rftactileInfoRaw";

fid = fopen(filename);

i = 1;
while (!feof(fid))

  line = fgetl(fid);
  data_cells = strsplit(strtrim(line));
  
  data_rf_raw(i).time = str2num(data_cells{1});
  ind = 2;
  
  for j = 1 : (length(data_cells) - 1) / 5
    data_rf_raw(i).points(j, 1) = str2num(data_cells{ind}); ind = ind + 1;
    data_rf_raw(i).points(j, 2) = str2num(data_cells{ind}); ind = ind + 1;
    data_rf_raw(i).forces(j, 1) = str2num(data_cells{ind}); ind = ind + 1;
    data_rf_raw(i).forces(j, 2) = str2num(data_cells{ind}); ind = ind + 1;
    data_rf_raw(i).forces(j, 3) = str2num(data_cells{ind}); ind = ind + 1;
  end
  
  i = i + 1;

end

fclose(fid);

%%%

filename = "/tmp/TactileTest.rftactileInfoHull";

fid = fopen(filename);

i = 1;
while (!feof(fid))

  line = fgetl(fid);
  data_cells= strsplit(strtrim(line));
  
  data_rf_hull(i).time = str2num(data_cells{1});
  ind = 2;
  
  for j = 1 : (length(data_cells) - 1) / 2
    data_rf_hull(i).points(j, 1) = str2num(data_cells{ind}); ind = ind + 1;
    data_rf_hull(i).points(j, 2) = str2num(data_cells{ind}); ind = ind + 1;
  end
  
  i = i + 1;

end

fclose(fid);

%%%

filename = "/tmp/TactileTest.rftactileInfoProc";

fid = fopen(filename);

i = 1;
while (!feof(fid))

  line = fgetl(fid);
  data_cells = strsplit(strtrim(line));
  
  data_rf_proc(i).time = str2num(data_cells{1});
  ind = 2;
  
  for j = 1 : (length(data_cells) - 1) / 2
    data_rf_proc(i).points(j, 1) = str2num(data_cells{ind}); ind = ind + 1;
    data_rf_proc(i).points(j, 2) = str2num(data_cells{ind}); ind = ind + 1;
  end
  
  i = i + 1;

end

fclose(fid);