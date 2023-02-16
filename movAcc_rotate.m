function [ ] = movAcc_rotate(h,omega)
l = 53.0; % mm
%speed = ((abs(phi)/360)*pi*l)/dTime;
speed = (omega/360)*l*pi;

if speed < 131
p = speed / 0.13;
    if phi < 0
        p = round(p);
        kSetSpeed(h,+p,-p);

    else
        p = round(p);
        kSetSpeed(h,-p,+p);

    end
    
else
    
p = 1000;
   if phi < 0
        
        kSetSpeed(h,+p,-p);

   else
        
        kSetSpeed(h,-p,+p);

   end
   
end


end

