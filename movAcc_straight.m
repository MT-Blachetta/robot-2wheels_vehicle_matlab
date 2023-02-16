function [ ] = movAcc_straight( h,speed )

if speed > 130
    
    p = 1000;
    kSetSpeed(h,p,p);


else
    
 
    p = speed/0.13; 
    p = round(p);
    kSetSpeed(h,p,p);  
  

end


end


