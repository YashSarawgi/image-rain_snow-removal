function Il = lf_analysis(I)
    Mi = detect_rain_snow(I);
    Idoub = double(I); 
    Iha = Idoub.*Mi;  %Hadamard product
    Im(:,:,1) = fill_hole_mean(Iha(:,:,1),Mi);
    Im(:,:,2) = fill_hole_mean(Iha(:,:,2),Mi);
    Im(:,:,3) = fill_hole_mean(Iha(:,:,3),Mi);
    Il = uint8(Im);
end