function KAG_SingleDriver
    global v0 Thead a b delta s0 lveh Xblock

    % set model parameters
    v0 = 28; % m/s (28 m/s ~ 60 mph)
    Thead = 2; % s
    a = 0.5; % m/s^2
    b = 5; % m/s^2
    delta = 4; % exponent
    s0 = 2; % m gap
    lveh = 5; % m -- vehicle length
    Xblock = 3000; % blockage

    xInitial = 0;
    vInitial = 0;
    timeEnd = 200;
    X=[xInitial;vInitial];
    
    [t,Xout] = ode45(@rate_func,[0,timeEnd],X);
    
    figure()
    plot(t,Xout(:,1))
    
    figure()
    plot(t,Xout(:,2))
    
    
end

function r=rate_func(t,X)
    global Xblock lveh v0 delta s0 Thead a b
    x=X(1);
    v=X(2); 
    
    s=Xblock-lveh-x;
    sStar = s0 + v*Thead + (v*(v-0))/(2*sqrt(a*b));
    
    dx=v;
    dv=a*(1-((v/v0)^delta)-(((sStar)/(s))^2));
    
    r = [dx;dv];
end



