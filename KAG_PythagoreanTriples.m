% Kyle Gersbach
% 1/16/2020

function triples = KAG_PythagoreanTriples(n)
    triples = [];
    for a = 1:n
        for b = a:n
            c = sqrt(a^2 + b^2);
            if floor(c)==c
                
                %Now check others to see if it is a multiple
                if isempty(triples)
                    triples(size(triples)(1)+1,:) = [a,b,c];
                    disp([a,b,c])
                else
                    if gcd(a,b)==1
                        triples(size(triples)(1)+1,:) = [a,b,c];
                        disp([a,b,c])
                    end
                end
            end
        end
    end
end
