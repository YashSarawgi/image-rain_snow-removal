function Ih_final = hf_analysis(Il,Ih,I,opt)
    
    %layer 1 operation
    Il_edge = Il;
    lap = [1,1,1;1,-8,1;1,1,1];
    Il_edge = Il_edge + 0.1*imfilter(Il_edge,lap,'replicate');
    imwrite(uint8(Il_edge),'output/edge_enhanced.jpg');
    Ih_new = imguidedfilter(Ih,Il_edge);
    Ir = Ih_new + Il_edge;
    imwrite(uint8(Ir),'output/recovered.jpg');
    
    %layer 2 operation
    Icr = min(Ir,I);
    imwrite(uint8(Icr),'output/clear_recoverd.jpg');
    
    %layer 3 operation
    if opt == 0
        b= 0.8;
    else
        b= 0.5;    
    end
    
    Iref = (b*Icr)+((1-b)*Ir);
   
    Irr = imguidedfilter(Icr,Iref);
    Ih_final = uint8(Irr);

end