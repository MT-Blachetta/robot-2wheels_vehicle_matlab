function [ obstacle ] = obstacleEstimation( sensorNr, sensInfo )

dia = 53;

obstacle = [ 0; 0 ];
poses = zeros(4,2);

for k = 1:4

x = sensInfo(k,1);
y = sensInfo(k,2);
phi = sensInfo(k,3);


sensOrient = sensorNrOrientation(phi,sensorNr);

sensPos = shiftPoint(dia/2, x,y, sensOrient);

sensorDist = sensInfo(k,4); % cm

posObstacle = shiftPoint( sensorDist*10, sensPos(1), sensPos(2), sensOrient );
poses(k,1) = posObstacle(1);
poses(k,2) = posObstacle(2);
end

obstacle(1) = mean(poses(:,1)) + 1;
obstacle(2) = mean(poses(:,2)) + 1;



end

