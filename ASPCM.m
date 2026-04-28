function [out] = ASPCM(im_gray)
add_Length = 8; 
im_gray = padarray(im_gray,[add_Length add_Length]','both');  
[row,col] = size(im_gray);

%----------------Construct Edge Images-------------
im_gray=localmean(im_gray,ones(2)); 
rBW = double(im_gray);
EdgeMod_x1 = [1,0,-1;2,0,-2;1,0,-1];
EdgeMod_y1 = [1,2,1;0,0,0;-1,-2,-1];
Ex1 = imfilter(rBW,EdgeMod_x1,'symmetric');
Ey1 = imfilter(rBW,EdgeMod_y1,'symmetric');
BW1= max(abs(Ex1),abs(Ey1));


%----------------Scale estimation and ASPCM calculation-------------
mask3=ones(3);
average3=localmean(im_gray,mask3);

My_value = zeros(row,col);
Max_Xmap = Max_Xmap_Get6(BW1);
Max_Ymap = Max_Ymap_Get6(BW1);

row = uint16(row);
col = uint16(col);

for i = add_Length+1:row-add_Length
    for j = add_Length+1:col-add_Length
        m1=Max_Xmap(i,j);
        m1 = j-m1;
        
        m2=Max_Xmap(i,j+5);
        m2 = m2 - j;
        
        n1=Max_Ymap(i,j);
        n1 = i - n1;
        
        n2=Max_Ymap(i+5,j);
        n2 = n2 - i;
       
        if (m1>4 || m2>4 || m1+m2<1 || m1-m2>1 || m2-m1>1 || n1>4 || n2 >4 || n1+n2<1 || n1-n2>1|| n2-n1>1)
            continue;
        end

         m0 = mean(mean(im_gray(i-n1+1:i+n2-1,j-m1+1:j+m2-1)));  
        cm1 = average3(i-n1-3,j-m1-3);
        cm2 = average3(i-n1-3,j);
        cm3 = average3(i-n1-3,j+m2+3);
        cm4 = average3(i,j+m2+3);
        cm5 = average3(i+n2+3,j+m2+3);
        cm6 = average3(i+n2+3,j);
        cm7 = average3(i+n2+3,j-n1-3);
        cm8 = average3(i,j-n1-3);
        
        tmp_m = [cm1,cm2,cm3,cm4,cm5,cm6,cm7,cm8,0];
        My_value(i,j) = double(m0-max(tmp_m))^2;
    end
end

My_value = My_value(add_Length+1:-add_Length+row,add_Length+1:-add_Length+col);
out = My_value;

end


