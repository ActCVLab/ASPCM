%--------Maximum value operation--------
function Max_Matrix = Max_Xmap_Get6(Input_Matrix)

k = 6;  
[ROW,COL] = size(Input_Matrix);
Max_Matrix = zeros(ROW,COL);
tmp = zeros(1,COL+k);

for i = 1 : ROW
    tmp = Local_Max_6(COL+k,[0,0,0,0,0,Input_Matrix(i,:)]);   
    Max_Matrix(i,:) = tmp(1:COL);
end
