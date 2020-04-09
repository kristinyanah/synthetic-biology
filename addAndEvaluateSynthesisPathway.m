function addAndEvaluateSynthesisPathway(api , Ecol_model);
%%
r=0; apilen = length(api);   %length of api charecters 
for i=1:apilen               % for loop with number of reactions
    if api(i)=='R'
        r=r+1;
        api_call(r,1) = api(i);   % determines each reaction name
        api_call(r,2) = api(i+1); %
        api_call(r,3) = api(i+2); %
        api_call(r,4) = api(i+3); %
        api_call(r,5) = api(i+4); %
        api_call(r,6) = api(i+5); %
    end
end
for o=1:r
    for v=1:6
        api_calling(v)=api_call(o,v); % get information about each reaction one by one
    end
    
disp (api_calling);
url = ['http://rest.kegg.jp/get/' api_calling]; %get data of reaction
a   = webread(url);
%% 
[C1 , C2 , C3 , C4 , C5 , Reaction_Formula , Count , R , F] = getSynthesisReactions(a,api_call(r));
%% 
[newmodel]  = addReaction(Ecol_model.mainModel,R,'reactionFormula',F);
%disp(newmodel);
%% 
newmodel = addSinkReactions(newmodel,R);
%disp(newmodel);
%% 
[biomass_update] = evaluateYieldForSynthesisPathway(newmodel , R);
disp('After adding new reactions, growth rate = ');
disp(biomass_update);
end
end