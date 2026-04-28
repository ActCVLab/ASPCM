%--------Maximum value operation--------
function Max_Matrix = Max_Ymap_Get6(Input_Matrix)

k = 6; 

[ROW,COL] = size(Input_Matrix);
Max_Matrix = zeros(ROW,COL);
tmp = zeros(1,ROW+k);

for i = 1 : COL
    tmp = Local_Max_6(ROW+k,[0,0,0,0,0,Input_Matrix(:,i)']);  
    Max_Matrix(:,i) = tmp(1:ROW);
end



