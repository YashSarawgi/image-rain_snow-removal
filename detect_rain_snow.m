function Mi = detect_rain_snow(I)
    imgG = I(:,:,2);
    imgB = I(:,:,3);
    imgR = I(:,:,1);
    
    row=size(I,1);
    col=size(I,2);
    Mi=ones(row,col);
    
    MiR = getMi(imgR);
    MiB = getMi(imgB);
    MiG = getMi(imgG);
    for i = 1:row
        for j = 1:col
            if (MiR(i,j)==0 && MiG(i,j)==0 && MiB(i,j)==0)
                Mi(i,j)=0;
            end
        end
    end
end