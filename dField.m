function [ results ] = dField(x,y,points)


difX = 0;
difY = 0;

sz = size(points);

for i = 1:sz(2)
      
   xp = points(1,i);
   yp = points(2,i);
   power = points(3,i);
   sc = points(4,i);
   
   vals = difFuncGauss(x,y,  xp,yp,power,sc );
   difX = difX + vals(1);
   difY = difY + vals(2);
   
    
end

dSpeedFactor = sqrt( difX*difX + difY*difY );
direction = atan2(difY,difX);
direction = ((direction*180)/pi);
direction = direction-360*(direction>360);

results = [ difX; difY ;direction; dSpeedFactor ];

end

