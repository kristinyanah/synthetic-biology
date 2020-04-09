function [Cobra_Name] = get_cobra_name(compound)
a=load('EcoliiJO1366_inGlcOx_KEGGID.mat');
b=load('EcoliiJO1366_inGlcOx.mat');
    len=length(compound);
    z=1;
    for x=2:len    
        C(x-1)=compound(x);
    end
    multiplier = 1000;
    c=0;
    lenc=length(C);
    for d=1:lenc
        c=c+(C(d)-48)*multiplier;
        multiplier=multiplier/10;
    end
if c==810
  Cobra_Name = 'Acetoin';
elseif c==1412
  Cobra_Name = 'Butanal';
elseif c==6142
    Cobra_Name = '1-Butanol';
elseif c==3044
    Cobra_Name = '-2,3-Butanediol';
else
lena = length(a.EColiKeggID);
for x=1:lena
    if a.EColiKeggID(1,x)==c
        z=x;
        break;
    else
        z=1;
    end
end
    
Cobra_Name = b.mainModel.metNames(z,1);
end
end