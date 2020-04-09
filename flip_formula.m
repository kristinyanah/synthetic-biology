function  RF = flip_formula(F)
  len = length(F);
    d=0;z=1;
    for x=len:-1:1
        if F(x)~=' '
            d=d+1;
        elseif x==1
            for y=1:d
            RF(z+y) = F(x+y);
            end
            z=z+d;
            d=0;
        else
            for y=1:d
            RF(z+y) = F(x+y);
            end
            z=z+d;
            d=0;
        end
    end
end