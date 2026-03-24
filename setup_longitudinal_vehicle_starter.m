function scenario = setup_longitudinal_vehicle_starter(scenarioName)
% Load parameters and a selected scenario for the MEKAI longitudinal starter.

if nargin < 1 || strlength(string(scenarioName)) == 0
    scenarioName = "default";
end

params.mass = 1650;
params.rhoAir = 1.225;
params.Cd = 0.29;
params.frontalArea = 2.24;
params.Crr = 0.012;
params.g = 9.81;
params.maxTractiveForce = 4200;
params.maxBrakeForce = 8200;
params.initialSpeed = 0;
params.initialDistance = 0;

driver.Kp = 0.09;
driver.Ki = 0.03;

scenario = get_longitudinal_vehicle_scenario(scenarioName);
targetSpeedProfile = scenario.targetSpeedProfile;
roadGradeProfile = scenario.roadGradeProfile;

simConfig.stopTime = targetSpeedProfile(end, 1);
simConfig.modelName = "mekai_longitudinal_vehicle_starter";

assignin("base", "params", params);
assignin("base", "driver", driver);
assignin("base", "targetSpeedProfile", targetSpeedProfile);
assignin("base", "roadGradeProfile", roadGradeProfile);
assignin("base", "simConfig", simConfig);
assignin("base", "activeScenario", scenario);
end
