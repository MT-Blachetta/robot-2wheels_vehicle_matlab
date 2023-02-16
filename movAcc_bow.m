function [ ] = movAcc_bow(h,speed,bow)

kSetSpeed(h,round(speed*bow/0.13),round(speed/0.13));

end

