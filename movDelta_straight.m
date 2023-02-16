function [ NewPosition ] = movDelta_straight( h,encState ,orientation,x,y, len_mm, speed )

%kSetSpeed(h,0,0);
sign = len_mm/abs(len_mm);

if speed > 130
    
    dtime = abs(len_mm)/130;
    p = 1000;
    kSetSpeed(h,sign*p,sign*p);
    pause(dtime-0.05);
    

else
    
    dtime = abs(len_mm)/speed;
    p = speed/0.13; 
    p = round(p);
    
    %p
    kSetSpeed(h,sign*p,sign*p);  
    pause(dtime-0.05);
    
  

end



enc = kGetEncoders(h);

encoder(1) = enc(1) - encState(1);
position = shiftPoint( encoder*0.13,x,y,orientation );

NewPosition = [position;enc];
       

% dtime in s

end

