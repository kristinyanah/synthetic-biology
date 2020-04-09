function [R] = getReactionName(a)
R='Butanal';
lena = length(a); %length of data received
for x=1:lena % gets the equation name after the EQUATION word
   if a(x)=='N' && a(x+1)=='A' && a(x+2)=='M' && a(x+3)=='E'
       for y=12:120 % started from 12 due to spaces after EQUATION
           if a(x+y)==10 % breaks if a new line was existed
               break;
           end
           R(y-11)=a(x+y);
       end
   end
end
end
