function[full_data_I, full_data_Q] = get_offset(full_data_I, full_data_Q)

%for xpi set 475:650
%otherwise set 950:1250

start = 950
finish = 1250

offset_I = 0;
offset_Q = 0;

size(full_data_I);

for i = 1:8
    I = mean(full_data_I(start:finish,:,i));
    Q = mean(full_data_Q(start:finish,:,i));
    offset_I = offset_I + I
    offset_Q = offset_Q + Q
end

offset_I
offset_Q
offset_I = (1/8)*offset_I
offset_Q = (1/8)*offset_Q

full_data_I = (full_data_I - offset_I)
full_data_Q = (full_data_Q - offset_Q)
    




end