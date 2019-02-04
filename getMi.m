function Mi = getMi(I)
    row=size(I,1);
    col=size(I,2);
    Mi=ones(row,col);
    I_repl = repl(I);
    for i = 1:row
        for j = 1:col
            Imid = getM(I_repl,i,j);
            ITL = getTL(I_repl,i,j);
            ITR =getTR(I_repl,i,j);
            IBL =getBL(I_repl,i,j);
            IBR =getBR(I_repl,i,j);
            Imax = max(Imid,ITL);
            Imax = max(Imax,ITR);
            Imax = max(Imax,IBL);
            Imax = max(Imax,IBR);
            if I(i,j) > Imax
                Mi(i,j)=0;
            end
        end
    end
end

function I_repl = repl(I)
    row=size(I,1);
    col=size(I,2);
    row=row+12;
    col=col+12;
    M=ones(row,col);
    for i = 1:row
        for j= 7:col-6
            if (i==1||i==2||i==3||i==4||i==5||i==6)
                M(i,j)=I(1,j-6);
                continue;
            end
            if (i==row||i==row-1||i==row-2||i==row-3||i==row-4||i==row-5)
                M(i,j) = I(row-12,j-6);
                continue;
            end
            
            M(i,j)=I(i-6,j-6);
        end
    end
    for i=1:row
        for j=1:6
            M(i,j)=M(i,7);
        end
        for j=col-5:col
            M(i,j)=M(i,col-6);
        end
    end
    I_repl=M;
end

function Imid = getM(I_repl,i,j)
    sum = 0;
    i=i+6;
    j=j+6;
    for m= i-3:i+3
        for n=j-3:j+3
            sum=sum+I_repl(m,n);
        end
    end
    Imid=sum/49;
end

function ITL = getTL(I_repl,i,j)
    sum=0;
    i=i+6;
    j=j+6;
    for m=i:i+6
        for n=j:j+6
            sum = sum+I_repl(m,n);
        end
    end
    ITL = sum/49;
end

function ITR = getTR(I_repl,i,j)
    sum = 0;
    i=i+6;
    j=j+6;
    for m = i:i+6
        for n = j-6:j
            sum = sum+I_repl(m,n);
        end
    end
    ITR =sum/49;
end

function IBL = getBL(I_repl,i,j)
    sum=0;
    i=i+6;
    j=j+6;
    for m = i-6:i
        for n = j:j+6
            sum = sum+I_repl(m,n);
        end
    end
    IBL = sum/49;
end

function IBR = getBR(I_repl,i,j)
    sum=0;
    i=i+6;
    j=j+6;
    for m= i-6:i
        for n= j-6:j
            sum = sum+I_repl(m,n);
        end
    end
    IBR=sum/49;
end
