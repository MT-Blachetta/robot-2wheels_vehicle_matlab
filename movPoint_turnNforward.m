function [ newPos ] = movPoint_turnNforward( h,enc,speed, orientation,x,y, x_pos,y_pos)

if orientation > 180
     orientation = orientation - 360;
end

dx = x_pos - x;
dy = y_pos - y;
angle = atan2(dy,dx);

grad = (angle*180)/pi;

dist = sqrt( dx*dx + dy*dy );
dist = round(dist);

error = 97/100;

direction = movToAngle(h,enc,orientation,grad*error,speed*281/130);

vec = movDelta_straight(h,[direction(2);direction(3)],direction(1),x,y, dist*error,speed );
nx = vec(1);
ny = vec(2);

newPos = [direction(1);nx;ny;vec(3);vec(4)];




end

