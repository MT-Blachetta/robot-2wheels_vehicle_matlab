function [ s_phi ] = sensorNrOrientation(phi,sensorNr)

relative = [ -13; -45; -90; -135; 135; 90; 45; 13 ];


s_phi = phi + 360*(phi<0)
s_phi = mod(s_phi+relative(sensorNr),360)
s_phi = s_phi - 360*(s_phi>180)


end

