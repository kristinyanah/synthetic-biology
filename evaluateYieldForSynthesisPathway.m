function [biomass_update] = evaluateYieldForSynthesisPathway(newmodel , R)
modelEcore_NEW = changeObjective(newmodel, R);
modelEcore_NEW = changeRxnBounds(modelEcore_NEW,'EX_glc__D_e',-10,'l'); % Set glucose uptake
modelEcore_NEW = changeRxnBounds(modelEcore_NEW,'EX_o2_e,'-1000,'l');


modelEcore_NEW = changeRxnBounds(modelEcore_NEW,'BIOMASS_Ec_iJO1366_WT_53p95M',0.1*0.001662,'l');
FBAsolution_update = optimizeCbModel(modelEcore_NEW,'max');
FBAsolution_update.f
end