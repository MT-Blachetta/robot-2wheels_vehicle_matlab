function [ pos ] = sensorNrPosition(x,y,phi, sensorNr)

diameter = 53.0;
r = diameter/2;

alpha = sensorNrOrientation(phi,sensorNr);

pos = shiftPoint(r,x,y,alpha);

end

