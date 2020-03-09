function KAG_VibratingMasses()
    
    %Fixed-Fixed
    numSprings = 5;
    numMasses = numSprings-1;
    
    A = diag(ones(numSprings-1,1),+1) + diag(ones(numSprings-1,1),-1) + -2*diag(ones(numSprings,1));
    
    [v1,lam1]=eig(A);
    lam1 = diag(lam1);
    freq1 = sqrt(-1*lam1); 
    
    disp("For case A (Fixed-Fixed):");
    for i=1:length(lam1)
        disp(["A Natrual Frequency : ",num2str(lam1(i))," 1/s has an eigenvector of: "]);
        disp(v1(:,1));
    end
    
    disp("");
    
    %Fixed-Free
    nS = numSprings-1;
    
    B = A(1:nS,1:nS);
    B(nS,nS)=-1;
    
    [v2,lam2]=eig(B);
    lam2 = diag(lam2);
    freq2 = sqrt(-1*lam2); 
    
    disp("For case B (Fixed-Free):");
    for i=1:length(lam2)
        disp(["A Natrual Frequency : ",num2str(lam2(i))," 1/s has an eigenvector of: "]);
        disp(v2(:,1));
    end
    

end