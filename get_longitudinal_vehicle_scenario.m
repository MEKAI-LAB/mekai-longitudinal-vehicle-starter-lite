function scenario = get_longitudinal_vehicle_scenario(scenarioName)
% Return a named scenario for the MEKAI longitudinal vehicle starter.

scenarioName = lower(string(scenarioName));

switch scenarioName
    case "default"
        scenario.name = "default";
        scenario.label = "Default mixed-speed run";
        scenario.description = "Baseline scenario with acceleration, cruising, and mild grade changes.";
        targetTime = [0; 5; 12; 20; 30; 40; 50; 60];
        targetSpeed = [0; 0; 8; 15; 22; 18; 10; 0];
        gradeTime = [0; 18; 28; 36; 48; 60];
        gradeDeg = [0; 0; 2.5; 0; -1.5; 0];
    case "urban_commute"
        scenario.name = "urban_commute";
        scenario.label = "Urban commute";
        scenario.description = "Stop-start city style drive cycle with moderate braking and low-speed cruising.";
        targetTime = [0; 4; 10; 18; 24; 30; 40; 52; 60];
        targetSpeed = [0; 0; 6; 14; 7; 0; 12; 8; 0];
        gradeTime = [0; 16; 24; 36; 48; 60];
        gradeDeg = [0; 0.5; 0; 1.0; -0.5; 0];
    case "hill_hold"
        scenario.name = "hill_hold";
        scenario.label = "Hill response";
        scenario.description = "Longer climb followed by recovery to evaluate grade disturbance response.";
        targetTime = [0; 5; 15; 25; 40; 55; 70];
        targetSpeed = [0; 0; 10; 18; 18; 12; 0];
        gradeTime = [0; 12; 24; 42; 55; 70];
        gradeDeg = [0; 0; 3.5; 4.5; 1.0; 0];
    otherwise
        error("Unknown scenario '%s'. Use default, urban_commute, or hill_hold.", scenarioName);
end

scenario.targetSpeedProfile = [targetTime targetSpeed];
scenario.roadGradeProfile = [gradeTime gradeDeg];
end
