function [C] = get_equation(a)
lena = length(a); %length of data received
for x=1:lena % gets the equation name after the EQUATION word
   if a(x)=='E' && a(x+1)=='Q' && a(x+2)=='U' && a(x+3)=='A' && a(x+4)=='T' && a(x+5)=='I' && a(x+6)=='O' && a(x+7)=='N'
       for y=12:120 % started from 12 due to spaces after EQUATION
           if a(x+y)==10 % breaks if a new line was existed
               break;
           end
           C(y-11)=a(x+y);
       end
   end
end

end