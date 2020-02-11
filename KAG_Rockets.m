% Kyle Gersbach
% Homework 4
% 2/10/2020

function KAG_Rockets()
    global massRocket initialFuelMass burnTime thrust
    massRocket = 150000;
    initialFuelMass = 2500000;
    burnTime = 300;
    thrust = 45000000;
    timeEnd = 1000;
    
    %Initial Conditions for ODE
    time = [0,timeEnd];
    y0=0;
    v0=0;
    Y=[y0;v0];
    
    
    [t,Yout] = ode45(@NewtonSecond,time,Y);
    
    len = length(t);
    m=zeros(1,len);
    f=zeros(1,len);
    
    for i=1:length(t)
        m(i) = Mass(t(i));
        f(i) = Force(t(i),Yout(i,1));
    end
    
    
    figure()
    plot(t,Yout(:,1))
    title('Plot of Elevation vs Time');
    xlabel('Time (s)');
    ylabel('Elevation of Rocket (m)');
    
    figure()
    plot(t,Yout(:,2))
    title('Plot of Velocity vs Time');
    xlabel('Time (s)');
    ylabel('Velocity of Rocket (m/s)');
    
    figure()
    plot(t,m)
    title('Plot of Mass vs Time');
    xlabel('Time (s)');
    ylabel('Mass of Rocket (kg)');
    
    figure()
    plot(t,f)
    title('Plot of Net Force vs Time');
    xlabel('Time (s)');
    ylabel('Net Force (N)');
    
    
    
end

function m=Mass(t)
    global massRocket initialFuelMass burnTime
    rate = -(initialFuelMass/burnTime);
    if t < burnTime
        m = massRocket + initialFuelMass + rate.*t;
    else
        m = massRocket;
    end

end

function f=Force(t,y)
    global thrust burnTime
    bigG = -6.674e-11;
    earthMass = 5.97e24;
    earthRadius = 6.371e6;
    fGrav = (bigG.*earthMass.*Mass(t))./((earthRadius+y)^2);
    if t>burnTime
        f=fGrav;
    else
        f=thrust+fGrav;
    end
    
end

function r=NewtonSecond(t,Y)
    y=Y(1);
    v=Y(2);
    
    dy=v;
    dv=Force(t,y)/Mass(t);
    
    r=[dy;dv];

end
