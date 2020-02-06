function KAG_QuantumOscillator()
    % set some parameters
    global V0 a hbar m E
    V0= 50;
    a=1.e-11; % m
    hbar=197*1e-9; % hbar-c
    m=0.511*1e6; % eV/c2
    E=413; % eV Energy level
    
    %initial conditions
    psi0=0;
    psip0=1;
    
    xMin = -10*a;
    xMax = 10*a;
    
    
    
    [x,pout] = ode45(@Rate,[xMin,xMax],[psi0;psip0]);
    psi = pout(:,1);
    
    plot(x,psi);
    xlim([-5*a,5*a])
end

function r=Rate(x,P)
    global V0 a hbar m E

    % unpack
    psi = P(1);
    psip = P(2);
        
        
    % compute rates
    dpsi = psip;
    dpsip = -(2*m/hbar^2)*(E - V0*(x^2/a^2))*psi;
        
    % pack rates into column vector
    r = [dpsi; dpsip];
end
