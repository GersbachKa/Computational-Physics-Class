function KAG_QuantumOscillator()
    global v0 hbar a m E
    v0=50;
    hbar = 197*1e-9;
    m=.511*1e6;
    E=413;
    a=1.e-11;
    
    %initial conditions
    xMin = -10*a;
    xMax = 10*a;
    
    [] = ode45(@Rate,[xMin,xMax],[])
    
end

function r=Rate(x,P)
    psi = P(1);
    psip = P(2);
    
    dpsi = psip;
    dpsip = -1*(hbar/(2*m))*(E-potential(x))*psi;
    
    r = [dpsi;dpsip];
end

function v=potential(x)
    global v0 a
    v=v0.*((x^.2)./(a^2));
end