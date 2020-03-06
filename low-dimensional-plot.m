load BBCdata.mat
[LowDim_data,V,mu]=datasetPCA(DocVectors, 3);
figure
data1 = LowDim_data(:,1);
data2 = LowDim_data(:,2);
data3 = LowDim_data(:,3);

X = [LowDim_data(:,1), LowDim_data(:,1),LowDim_data(:,1)];
Y = [LowDim_data(:,2), LowDim_data(:,2),LowDim_data(:,2)];
Z = [LowDim_data(:,3), LowDim_data(:,3),LowDim_data(:,3)];
x = X(:);
y = y(:);
z = Z(:);

S = repmat([1, 1, 1], numel(DocClasses),1);
s = S(:);

C = repmat([1, 1, 1], numel(DocClasses), 1).*(DocClasses);
c = C(:);

scatter3(x,y,z,s,c)
