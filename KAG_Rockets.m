function KAG_Rockets()
    global massRocket initialFuelMass burnTime thrust
    massRocket = 150000;
    initialFuelMass = 2500000;
    burnTime = 300;
    thrust = 45000000;
    
    %Initial Conditions for ODE
    time = [0,800];
    y0=0;
    v0=0;
    Y=[y0;v0];
    
    %{
    t=[0:4:400];
    f=[];
    for i=[1:1:101]
        f(i)=Force(t(i),0);
    end
    plot(t,f)
    disp(f(100));
    %}
    
    [t,Yout] = ode45(@NewtonSecond,time,Y);
    
    plot(t,Yout(:,1))
    
    
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