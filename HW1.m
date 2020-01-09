m = 9.11 * (10^-31);
E = 10;
V = 9;
hbar = 6.582 * (10^-16);

k1 = sqrt(2*m*E)/hbar;
k2 = sqrt(2*m*(E-V))/hbar;

T = (4*k1*k2)/((k1+k2)^2);
R = ((k1-k2)/(k1+k2))^2;

disp("Given m="+m+" kg, E="+E+" eV, V="+V+" eV")
disp("Transmision probability: "+T+", and Reflection probability: "+R)

disp(" ")
%--------------------------------------------------------------------------
children = -1*ones(100,1);

for basket = 1:100
    current = basket;
    while current<=100
        children(current) = children(current)*-1;
        current=((current/basket)+1)*basket;
    end
end

%{ 
This is code that I know will work, checking the "optimized" version to see
if the resulting array is the same. 


child = -1*ones(100,1);

for basket = 1:100
    for check_child = basket:100
        if mod(check_child,basket)==0
            child(check_child)= child(check_child)*-1;
        end
    end
end

disp(isequal(child,children))

%}

%print out every child with a stick
disp("Children with a stick at the end of the stick game:")
for c = 1:100
    if children(c)>0
        disp(c)
    end
end

disp("All perfect squares!")
