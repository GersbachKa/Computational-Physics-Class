% Kyle Gersbach
% 1/16/2020


function fibs = Fibo(n)
    fibs = [0,1];
    if n>2 && floor(n) == n && abs(n)~=inf && isnumeric(n)
        for i = 3:n+1
            fibs(i) = fibs(i-1) + fibs(i-2);
        end
        
    elseif n == 2
        fibs = [0,1,1];
    
    elseif n == 1
        fibs = [0,1];
    
    elseif n == 0
        fibs = [0];
    
    else
        disp("The number must be a positive whole number.");
        fibs = [];
        
    end
end
