
function ret=diffInDuckMasses(d)
    rDuck = 10;
    rhoDuck = .3;
    mDuck = rhoDuck*((4/3)*pi*rDuck^3);
    rhoWater = 1;

    mWater = (rhoWater) * ((pi/3)*(3*rDuck*(d.^2)-(d.^3)));
    ret=mDuck-mWater;
end
