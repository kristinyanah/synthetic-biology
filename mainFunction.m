%% Cobra_Toolbox Initialization
%initCobraToolbox(false)

%% Importing a reconstruction model and reporting on various aspects of the model
Ecol_model=load('EcoliiJO1366_inGlcOx.mat');
Biomass_reaction = 'BIOMASS_Ec_iJO1366_WT_53p95M';

%% 
[Max_biomass] = initial_biomass( Ecol_model , Biomass_reaction);

%% 
for c = 1:2
fprintf('test case: %d\r\n',c);
api(1) = {'R02948 R02946'};
api(2) = {'R01976 R03544 R03026 R01175 R01172'};
Ecol_model=load('EcoliiJO1366_inGlcOx.mat');
Reaction = char (api(1,c));
addAndEvaluateSynthesisPathway(Reaction , Ecol_model);
close all
clear
end