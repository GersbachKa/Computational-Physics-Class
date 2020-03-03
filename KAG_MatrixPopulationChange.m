function KAG_MatrixPopulationChange()
    m=12; %Months to simulate
    initialPopulation = 100000;

    % Downtown, Capital Hill, Ballard, the U-district, and Fremont
    %x = zeros(5,m);
    x=ones(5,m).*initialPopulation;
    
    a1 = [-.2,.1,0,0,0];
    a2 = [.1,-.4,0,.1,0];
    a3 = [.1,.2,-.5,.1,0];
    a4 = [0,.1,.2,-.4,0];
    a5 = [0,0,.3,0,-.5];
    A = [a1;a2;a3;a4;a5];
         
    b = [400;-100;-100;0;0];
    
    for i=1:m
        x(:,i+1) = (A*x(:,i)+b) + x(:,1); %Population change + Last population
        disp(["Population change after ",num2str(i)," months."]);
        disp(x(:,i+1));
    end
    
    


end