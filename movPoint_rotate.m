function [ direction ] = movPoint_rotate(h,encState,x,y,orientation, x_pos, y_pos,omega)

if orientation > 180
     orientation = orientation - 360;
end

dx = x_pos - x;
dy = y_pos - y;
angle = atan2(dy,dx);

grad = angle*360/(2*pi);

error = 97/100;

%turnRAD(h,-angle,angle*error,1);


direction = movToAngle(h,encState,orientation,grad*error,omega);


end

