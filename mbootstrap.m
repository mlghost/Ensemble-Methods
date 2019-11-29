function [data,by]= mbootstrap(org_data,y, sample_size)

  %Implementation of bootstrapping with replacement

  data = zeros(sample_size,size(org_data,2));
  by = zeros(sample_size,1);

  for i= 1:sample_size
    index = randi([1 length(org_data)],1);
    data(i,:) = org_data(index,:);
    by(i) = y(index);
  end
end
