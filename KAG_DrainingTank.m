% Kyle Gersbach
% Homework 2
% 2/3/2020

function KAG_DrainingTank()
    global D0 h0 d g hf longEstimate shortEstimate
    D0 = 1; %initial Diameter
    h0 = 2; %initial water height
    d = 0.02; %drain diameter
    g = 9.81; %force due to Earth's gravity
    hf = 0.05; %final height of the water
    
    longEstimate = tanalytic(D0*1.1,h0); %analytic longest estimate
    shortEstimate = tanalytic(D0,h0); %analytic shortest estimate
    
    %calculate actual time to drain
    actualTime = fzero(@height_diff,[shortEstimate,longEstimate]);
    s = ["Time to wait is: " num2str(actualTime) " seconds."];
    disp(s)
    
    %Plot the resulting height vs time graph
    [t1,h1]= ode45(@rate,[0,actualTime],h0);
    plot(t1,h1)
    title('Plot of Height vs Time');
    xlabel('Time (s)');
    ylabel('Height of the water in the tank');
    
end

function D=diameter(h)
    global D0 h0
    D=(0.1*D0*sin((pi/h0).*h))+D0;
end

function rate=rate(t,h)
    global g d 
    D = diameter(h);
    rate=-1*sqrt(2*g)*((d^2)/(D^2))*sqrt(h);
end

function h=height(t)
    global h0
    [t1, h1]=ode45(@rate, [0,t], h0);
    %plot(t1,h1)
    h=h1(end);
end

function dif=height_diff(t)
    global hf
    dif = height(t) - hf;
end

function t=tanalytic(D,h)
    global g d hf
    coef = sqrt(2/g)*((D/d)^2);
    t=coef * (sqrt(h) - sqrt(hf));
end
