function [bio_grow_rate_aer] = initial_biomass( Ecol_model , Biomass_reacrtion)
%% Cobra_Toolbox Initialization
%Init_CobraToolbox(false);
%% 
changeCobraSolver ('gurobi', 'all');
modelFileName = 'EcoliiJO1366_inGlcOx.mat';
model = readCbModel(modelFileName);
mets = model.mets;
biomass    = 'BIOMASS_Ec_iJO1366_WT_53p95M';
%% 
e_coli_core1 = model;
e_coli_core1 = changeRxnBounds(e_coli_core1,'EX_glc__D_e',-8,'l');   % Set glucose uptake
e_coli_core1 = changeRxnBounds(e_coli_core1,'EX_o2_e',-1000,'l');
e_coli_core1 = changeObjective(e_coli_core1,'BIOMASS_Ec_iJO1366_WT_53p95M');
FBA_sol_aero = optimizeCbModel(e_coli_core1,'max'); % FBA analysis
bio_grow_rate_aer = FBA_sol_aero.f;% maximum growth rate
end