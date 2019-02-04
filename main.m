function main(I,opt)
    Il = imguidedfilter(lf_analysis(I));
    Ih =I-Il;
    Ih_final = hf_analysis(Il,Ih,I,opt);
    imwrite(uint8(Il),'output/resultlow.jpg');
    imwrite(uint8(Ih),'output/resulthigh.jpg');
    imwrite(uint8(Ih_final),'output/resultfinal.jpg');  
end