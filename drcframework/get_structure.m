function data = get_structure(filename)

fid = fopen(filename);
title = fgetl(fid);
fclose(fid);

log = load(filename);

fields_raw = strsplit(title);

for i = 2 : length(fields_raw)
  fields = regexp(fields_raw{i}, "[0-9a-zA-Z-_]+", 'match');
  data.(fields{2}) = log(:, str2num(fields{1}));
end