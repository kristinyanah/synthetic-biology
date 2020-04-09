function [F] = get_ReactionFormula(a)
    len = length(a);
    z=1; s=0; m=1;
    for x=1:len
        if a(x)=='D' && a(x+1)=='E' && a(x+2)=='F' && a(x+3)=='I' ...
                && a(x+4)=='N' && a(x+5)=='I' && a(x+6)=='T' && a(x+7)=='I' && a(x+8)=='O' && a(x+9)=='N'
            
            for y=1:len-x
                if a(x+y)~=10
                    z=z+1;
                else
                    break;
                end
            end
            for c=z-1:-1:4
                %if a(x+c)==' ' && a(x+c-1)==' '
                %    flag=0;
                %else
                if a(x+c)==' ' && a(x+c+1)~='+'  %&& a(x+c+1)~='>' && a(x+c+1)~='<'
                    
                    for l=1:s
                        if a(x+c+l)~=' ' && a(x+c+l)~='<' && a(x+c+l)~='=' && a(x+c+l)~='>'
                        F(m)=a(x+c+l);
                        m=m+1;
                        end
                    end
                    s=0;
                elseif a(x+c)=='+' && a(x+c+1)==' ' && a(x+c-1)==' '
                    F(m)=' ';
                    F(m+1)='+';
                    F(m+2)=' ';
                    m=m+3;
                    s=0;
                elseif a(x+c)=='>' && a(x+c-1)=='=' && a(x+c-2)=='<'
                    F(m)=' ';
                    F(m+1)='-';
                    F(m+2)='>';
                    F(m+3)=' ';
                    m=m+4;
                    s=s+1;
                end
                if a(x+c)~=' '
                s=s+1;
                end
            end
        end
    end
disp(F);
end