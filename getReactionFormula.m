function [Eq] = getReactionFormula(a)
   [C] = get_equation(a);
d=0;
len=length(C);
for x=1:len
    if C(x)=='C'
        for y=2:6
        CN(y-1) = C(x+y-1);
        end
        [CoN] = get_cobra_name(CN);
        Cobra_N = char(CoN);
        l = length(Cobra_N);
        for z=1:l
            Eq(d+z) = Cobra_N(z);
        end
        d = d+l+1;
        
    elseif C(x)=='+'
        Eq(d)=' ';
        Eq(d+1)='+';
        Eq(d+2)=' ';
        d=d+2;
    elseif C(x)=='='
        Eq(d)=' ';
        Eq(d+1)='<';
        Eq(d+2)='=';
        Eq(d+3)='>';
        Eq(d+4)=' ';
        d=d+4;
    end
    
end
end