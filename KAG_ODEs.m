function KAG_ODEs()
    global omega;
    omega=4*pi;
    interval=.01;
    
    y=[1];
    t=0:interval:1;
    for n=1:size(t,2)-1
        y(n+1)=y(n)+fOf(t(n),y(n))*interval;
    end
    
    [tout,yout]=ode45(@fOf,[t(1),t(n)],1);

    plot(t,y,tout,yout);
    
end

function ret=fOf(t,y)
    global omega;
    ret=y.*(1-sin(omega.*t));
end

function y=realfunc(t)
    global omega A;
    y=-1*A*exp(cos(omega*t)/omega)*exp(t);
end