function get_ReactionFormula
    len = length(a);
    z=1; r=1; s=0;
    for x=1:len
        if a(x)=='D' && a(x+1)=='E' && a(x+2)=='F' && a(x+3)=='I' ...
                && a(x+4)=='N' && a(x+5)=='I' && a(x+6)=='T' && a(x+7)=='I' && a(x+8)=='O' && a(x+9)=='N'
            for y=1:len-x
                if a(x+y)~=10
                    z=z+1;
                end
            end
            for c=z:12
                if a(x+c)==' '
                    F(z-x+1)=a(x+c+1)
                    for l=1:s
                        F(l)=a(x+c+1);
                    end
                end
                s=s+1;
            end
        end
    end
end