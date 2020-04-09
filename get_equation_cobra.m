function [E_Cob] = get_equation_cobra(C)
E_Cob = ' ';  d=0;  
len = length(C);
    for x=1:len
        if C(x)=='C'
            f=1;
            for y=1:6
                compound(y)=C(x+y-1);
            end
            [C_Name] = get_cobra_name(compound)
            
            
            C_N = char(C_Name)
            l=length(C_N);
            d=d+l;
            for y=1:l
                EC(y)=C_N(y);
            end
        elseif C(x)=='+'
            f=1;
            C_N = ' + ';
            l=length(C_N);
            d=d+l;
            %C_Name = char(C_Name);
            for y=1:l
                EC(y)=C_N(y);
            end
        elseif C(x)=='='
            f=1;
            C_N = '<=>';
            l=length(C_N);
            d=d+l;
            %C_Name = char(C_Name);
            for y=1:l
                EC(y)=C_N(y);
            end
        end
        if f==1;
            f=0;
            for z=1:l
                E_Cob(d+z-1)=EC(z);
            end
        end
    end
    disp(C_N(2));
end